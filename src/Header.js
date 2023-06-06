import axios from "axios";
import { toast } from "react-toastify";
import { Navbar, Container, Nav, NavDropdown } from "react-bootstrap";
import { useNavigate, Link } from "react-router-dom";

const Header = () => {
  const name = sessionStorage.getItem('name')
  const navigate = useNavigate()
  const handleLogout = () => {
    axios.post('http://localhost/quiz-app/api/logout.php').then((response) => {
      if (response.data.status === 'success') {
        sessionStorage.clear()
        toast.success(response.data.message, {
          position: "top-right",
          autoClose: 3000,
          hideProgressBar: false,
          closeOnClick: true,
        });
        navigate('/')
      }
    });
  }

  return (
    <div>
      <Navbar className="navbar mb-4 navbar-wrapper text-white">
        <Container>
          <Link to='/home' className="appName">QUIZ APP</Link>
          <Nav className="mr-auto">
            {
              name ?
                <>
                  <NavDropdown title={name} className="userlogout">
                    <NavDropdown.Item onClick={handleLogout}>Logout</NavDropdown.Item>
                  </NavDropdown>
                </>
                :
                null

            }
          </Nav>
        </Container>
      </Navbar>
    </div>
  );
}

export default Header;