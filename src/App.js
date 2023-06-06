import './App.css';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Login from './Login';
import Header from './Header';
import Home from './quiz/Home';
import { ToastContainer } from 'react-toastify';
import Quiz from './quiz/Quiz';
import QuizTopic from './quiz/QuizTopic';

function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <Header />
        <Routes>
          <Route path='/' element={<Login />}></Route>
          <Route path='/home' element={<Home />}></Route>
          <Route path='/quiz' element={<QuizTopic />}></Route>
          <Route path='/quiz/:id' element={<Quiz />}></Route>
        </Routes>
      </BrowserRouter>
      <ToastContainer></ToastContainer>
    </div>
  );
}

export default App;
