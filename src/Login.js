import { useEffect, useState } from 'react'
import axios from 'axios'
import { Link, useNavigate } from "react-router-dom"

const Login = () => {
    const [googleUrl, setGoogleUrl] = useState('')
    const token = sessionStorage.getItem('token')
    const navigate = useNavigate()
    useEffect(() => {
        if (!token) {
            axios.get('http://localhost/api/getUrl.php').then((response) => {
                if (response.data.authUrl) {
                    const url = response.data.authUrl
                    setGoogleUrl(url)
                }
            })
        } else {
            navigate('/home')
        }
    }, [])

    return (
        <div className="container">
            <div className="row">
                <div className="offset-lg-3 col-lg-6">
                    <div className="loginContainer">
                        <Link to={googleUrl} ><img src={process.env.PUBLIC_URL + '/google.png'} alt="Your Image" /></Link>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default Login;