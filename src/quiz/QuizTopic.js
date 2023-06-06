import axios from "axios";
import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { toast } from "react-toastify";

const QuizTopic = () => {
    const [topics, setTopics] = useState([])
    const [topicId, setTopicId] = useState('')
    const [topicName, setTopicName] = useState('')
    const [showInstruct, setShowInstruct] = useState(false)

    const navigate = useNavigate()

    const token = sessionStorage.getItem('token')
    if(!token){
        navigate('/')
    }

    useEffect(() => {
        axios.get('http://localhost/quiz-app/api/quiz.php', {
            params: {
                quiz: 'topics'
            }
        }).then((response) => {
            if (response.data.status === 'success') {
                setTopics(response.data.topics)
            } else {
                toast.error(response.data.message, {
                    position: "top-right",
                    autoClose: 3000,
                    hideProgressBar: false,
                    closeOnClick: true,
                });
            }
        })
    }, [])

    const handleProceed = () => {
        navigate('/quiz/'+topicId)
    }

    const handleTopic = (id,title) => {
        setShowInstruct(true)
        setTopicName(title)
        setTopicId(id)
    }
    const handleBack = () => {
        setShowInstruct(false)
        setTopicName('')
        setTopicId('')
    }

    return (
        <div>
            <div className="container">
                
                {
                    showInstruct ? (<div className="quiz-instruct">
                    <h4>Instructions for the next section:</h4>
                    <ul>
                        <li>You have chosen quiz for the topic <b>{topicName}</b></li>
                    <li>The quiz will have a total of ten questions. All of them are of Multiple Choice Questions type. </li>
                    <li>	Each question will have four multiple choice answers to choose and only one answer would be correct.</li>
                    <li>	Read the question carefully that is displayed on top. Click on the appropriate answer for the question and then click <b>Next</b> button for the next question. </li>
                    <li>	Be careful on selecting the answer. You will not be able to change your answer once proceeded to the next question. </li>
                    <li>	After answering all questions, your score will be displayed on the screen. </li>
                    <li>	There would not be any time limit. </li>
                    <li>	Click the button <b>"Proceed to Quiz"</b> to start the quiz. </li>

                    </ul>
                    <button onClick={handleProceed} className="quiz-btn btn btn-primary mr-5" type="button">Proceed to Quiz</button>
                    <button className="quiz-btn btn btn-danger ml-5" onClick={handleBack}>Go to Quiz Topics</button>
                </div>) :  
                (
                <div className="row mt-4">
                    <h4>Choose a topic to take Quiz</h4>
                    {
                        topics.map((data,i) => (
                            <div className="col-md-4 col-sm-6" key={i}><div className="topicDes" onClick={() => handleTopic(data.id,data.title)} >{data.title}</div></div>
                        ))
                    }
                </div>)
                }
            </div>
        </div>
    );
}

export default QuizTopic;