import axios from "axios";
import { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import { toast } from "react-toastify";

const Quiz = () => {
    const { id } = useParams()
    const navigate = useNavigate()

    const token = sessionStorage.getItem('token')
    const name = sessionStorage.getItem('name')

    const [topicName, setTopicName] = useState('')
    const [questions, setQuestions] = useState([])
    const [activeQuestion, setActiveQuestion] = useState(0)
    const [selectedAnswer, setSelectedAnswer] = useState(null)
    const [selectedVal, setSelectedVal] = useState(null)
    const [retake, setRetake] = useState(0)
    const [score, setScore] = useState(0);
    const [showScore, setShowScore] = useState(false);
    const [answers, setAnswers] = useState({
        'topics': {
            'topic_id': id,
            'user_name': name
        },
        'qn_ans': {}
    })

    useEffect(() => {
        if (!token) {
            navigate('/')
        }
        const val = getScore()
        if(!val){
            getQuestions()
        }else{
            
        }       
    }, [])

    const getScore = () => {
        var dataScore = new URLSearchParams();
        dataScore.append("topic", id);
        dataScore.append("name", name);

        axios.post('http://localhost/quiz-app/api/quiz.php', dataScore, {
            params: {
                quiz: 'getScore'
            }
        }).then((response) => {
            if (response.data.status === 'success') {
                setScore(parseInt(response.data.score))
                setShowScore(true)
                return true
            } else {
               return false
            }
        });
    }

    const getQuestions = () => {
        var dataQn = new URLSearchParams();
        dataQn.append("topic", id);
        axios.post('http://localhost/quiz-app/api/quiz.php', dataQn, {
            params: {
                quiz: 'questions'
            }
        }).then((response) => {
            if (response.data.status === 'success') {
                const data = response.data
                setQuestions(data.questions)
                setTopicName(data.topic)
            } else {
              
            }
        });
    }

    const handleAnswer = (ans, index, qn_id) => {
        const correct = questions[activeQuestion].correct_ans
        setSelectedVal(ans)
        setSelectedAnswer(index)
        setAnswers(prevAnswers => ({
            ...prevAnswers,
            qn_ans: {
                ...prevAnswers.qn_ans,
                [qn_id]: {
                    ...prevAnswers.qn_ans[qn_id],
                    user_answer: ans,
                    correct_ans: correct
                }
            }
        }));
    }
    const handleNext = () => {
        const correct = questions[activeQuestion].correct_ans

        if (selectedVal === correct) {
            setScore((prev)=>prev+1);
        }

        if (activeQuestion === questions.length - 1) {
            setShowScore(true)
        } else {
            setSelectedAnswer(null)
            setActiveQuestion((prev) => prev + 1)
        }
    }

    useEffect(() => {
        if (activeQuestion === questions.length - 1 && showScore) {
          saveAnswers(); 
        }
      }, [activeQuestion, questions.length, showScore]);

    const saveAnswers = () => {
        axios.post('http://localhost/quiz-app/api/quiz.php', {ans:answers,scoreData: score }, {
                params: {
                    quiz: 'answers'
                }
            }).then((response) => {
                if (response.data.status === 'success') {

                } else {
                    toast.error(response.data.message, {
                        position: "top-right",
                        autoClose: 3000,
                        hideProgressBar: false,
                        closeOnClick: true,
                    });
                }
            });
    }
    const handleRetake = () => {
        setRetake(1)
        setScore(0)
        setShowScore(false)
        setActiveQuestion(0)
        setSelectedAnswer(null)
        setSelectedVal(null)
        setAnswers(prevAnswers => ({
            ...prevAnswers,
            'qn_ans': {}
        }));
        getQuestions()
    }

    const handleBack = () => {
        navigate('/quiz')
    }
    return (
        <div>
            <div className="container">
                <h4>{topicName}</h4>
                <div className="mt-5 quiz-container">
                    {
                        showScore ?

                            <div>
                                You have scored {score} out of {questions.length}
                                <button className="mt-4 btn-danger" onClick={handleBack}>Go to Quiz Topics</button>
                                <button className="mt-4" onClick={handleRetake}>Retake Quiz</button>
                            </div>

                            :

                            questions.length > 0 ?
                                <div>
                                    <div className="question-section">
                                        <div className="question-count">
                                            <span>Question {activeQuestion + 1}</span>/{questions.length}
                                        </div>
                                        <div className="question-level">
                                            <span>Level : {questions[activeQuestion].level.charAt(0).toUpperCase() + questions[activeQuestion].level.slice(1)}</span>
                                        </div>
                                        <div className="question-text">
                                            {questions[activeQuestion].qns}
                                        </div>
                                    </div>
                                    <div className="answer-section">
                                        <ul>
                                            {
                                                questions[activeQuestion].options.map((answer, index) => (
                                                    <li onClick={() => handleAnswer(answer, index, questions[activeQuestion].qn_id)} className={selectedAnswer === index ? 'selected-answer' : null} key={index}>
                                                        {answer}
                                                    </li>
                                                ))
                                            }
                                        </ul>
                                        <button onClick={handleNext} disabled={selectedAnswer === null}>{activeQuestion === questions.length - 1 ? 'Submit' : 'Next'}</button>
                                    </div>
                                </div> :
                                <div>
                                    <div className="no-qns">No questions available.</div><button className="mt-4" onClick={handleBack}>Go to Quiz Topics</button>
                                </div>
                    }
                </div>
            </div>
        </div>
    );
}

export default Quiz;