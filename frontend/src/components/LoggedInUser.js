import React, {useState, useEffect} from "react";
import {Link} from "react-router-dom";
import Cookies from "js-cookie";

const IsLoggedUser = () => {
  const [authorized, setAuthorized] = useState(false);
  const [user, setUser] = useState({});
  const icon = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnRFE3qvVvOoMsoGpAHPPr8bZVCOBIsrKDqNjsM8wo8DSwGCRSxzbQQmVVnPpiqZcxQ08&usqp=CAU';

  useEffect(() => {
        if (localStorage.getItem('token') !== null) {
          setAuthorized(true);
          fetch('http://localhost:8000/api/user/', {
            headers: {
              "Content-Type": "application/json",
              'Authorization': `Token ${localStorage.getItem('token')}`,
              'X-CSRFToken': Cookies.get('csrftoken')
            },
            credentials: 'include'
          })
            .then(res => res.json())
            .then(data => {
              setUser(data);
            });
        }
    }, [authorized]);

    return(
        <div style={{margin: "auto", width: "12%"}}>
            {authorized &&
            <div className="dropdown">
                <img className="smal_user_avatar" src={ user.avatar || icon } alt=""/>
                <Link to="/profile" className="dropbtn">{ user.username }</Link>
                <div className="dropdown-content">
                    <Link to="/profile">Profile</Link>
                    <li><Link to="/change_password">Change password</Link></li>
                    <li><Link to="/logout">Logout</Link></li>
                </div>
            </div>
            }
            {!authorized &&
                <div className="menu-area">
                <div className="limit-box">
                    <nav className="main-menu">
                            <ul className="menu-area-main">
                                <li><Link to="/login">Sign In</Link></li>
                                <span>/</span>
                                <li><Link to="/register">Sign Up</Link></li>
                            </ul>
                    </nav>
                </div>
            </div>
            }
        </div>
    );
}

export default IsLoggedUser;
