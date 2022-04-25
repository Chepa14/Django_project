import React, {useState, useEffect} from "react";
import {Link} from "react-router-dom";
import {getCurrentUser, logout} from "../requests/requests";
import {local_frontend_url} from "../requests/constants";

const IsLoggedUser = () => {
  const [authorized, setAuthorized] = useState(false);
  const [user, setUser] = useState({});

  useEffect(() => {
        const token = localStorage.getItem('token')
        if (token !== null) {
          setAuthorized(true);
          setUser(getCurrentUser(token))
        }
    }, [authorized]);

    async function toLogout() {
        await logout(localStorage.getItem('token'))
        window.location.replace(`${local_frontend_url}/`)
    }

    return(
        <div style={{margin: "auto", width: "12%"}}>
            {authorized &&
            <div className="dropdown">
                <img className="smal_user_avatar" src={ user.avatar || "../images/default_user_img.png" } alt=""/>
                <Link to="/profile" className="dropbtn">{ user.username }</Link>
                <div className="dropdown-content">
                    <Link to="/profile">Profile</Link>
                    <li><Link to="/change_password">Change password</Link></li>
                    <li onClick={toLogout}><Link to="#">Logout</Link></li>
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
