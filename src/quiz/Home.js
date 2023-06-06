import axios from "axios";
import { useEffect, useState } from "react";
import { useNavigate, useSearchParams } from "react-router-dom";
import { toast } from "react-toastify";
import { Button } from "react-bootstrap";

const Home = () => {
    const [name, setName] = useState('')
    const [searchparams] = useSearchParams()
    const navigate = useNavigate()
    const storedName = sessionStorage.getItem('name')
    if (storedName && !name) {
        setName(sessionStorage.getItem('name'))
    }
    const refresh = sessionStorage.getItem('refresh')
    const code = searchparams.get('code')
    var urlencoded = new URLSearchParams();
    urlencoded.append("code", code);
    useEffect(() => {
        const token = sessionStorage.getItem('token')
        
        if (!token && !code) {
            navigate('/')
        }else if(refresh){
            urlencoded.append("refresh", refresh);
            axios.post('http://localhost/quiz-app/api/login.php', urlencoded).then((response) => {
                if (!response.data.error) {
                    sessionStorage.setItem('token', response.data.token.access_token);
                    sessionStorage.setItem('name', response.data.name);
                    sessionStorage.setItem('refresh', response.data.refresh);
                    setName(response.data.name)
                }
            });
        } else {
            axios.post('http://localhost/quiz-app/api/login.php', urlencoded).then((response) => {
                if (!response.data.error) {
                    sessionStorage.setItem('token', response.data.token.access_token);
                    sessionStorage.setItem('name', response.data.name);
                    sessionStorage.setItem('refresh', response.data.refresh);
                    setName(response.data.name)
                    toast.success('Loggedin Successfully', {
                        position: "top-right",
                        autoClose: 3000,
                        hideProgressBar: false,
                        closeOnClick: true,
                    });
                }
            });
        }
    }, []);

    const handleQuiz = () => {
        navigate('/quiz')
    }

    return (
        <div>
            <div className="container">
                <h4>Welcome {name}</h4>
                <div className="mt-5" style={{fontSize:'18px'}}>
                    <p>Wanna test your knowledge in any field??? We have a quiz zone that will help you identify your level of expertise and the scope to improve your knowledge.</p>
                    <p>We have more topics where you can enter and take a thrilling quiz ride.</p>
                    <p> Take this wonderful opportunity to examine who you are in your field. Have fun!!!</p>

                    <Button onClick={handleQuiz} className="quiz-btn">Click here to proceed to quiz zone</Button>
                </div>

            </div>
        </div>
    );
}

export default Home;