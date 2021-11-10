import React, {useState, useEffect} from "react";
import {Link} from "react-router-dom";

const IsLoggedUser = () => {
  const [authorized, setAuthorized] = useState(false);

  useEffect(() => {
        if (localStorage.getItem('token') !== null) {
          setAuthorized(true);
        }
    }, [authorized]);

    return(
        <div style={{margin: "auto", width: "12%"}}>
            <div className="menu-area">
                <div className="limit-box">
                    <nav className="one">
                        {/*main-menu */}
                        {authorized &&
                            <ul className="topmenu">
                            {/*menu-area-main    */}
                                <li>
                                    <Link to="/">
                                        <h2 style={{color: 'white'}}>Current User</h2>
                                    </Link>
                                    <ul className="submenu">
                                        <li><Link to="/">Profile</Link></li>
                                        <li><Link to="/">Change password</Link></li>
                                        <li><Link to="/">Logout</Link></li>
                                    </ul>
                                </li>
                            </ul>
                        }
                        {!authorized &&
                            <ul className="menu-area-main">
                                <li><Link to="/login">Sign In</Link></li>
                                <span>/</span>
                                <li><Link to="/register">Sign Up</Link></li>
                            </ul>
                        }
                    </nav>
                </div>
            </div>
        </div>
    );
}

export default IsLoggedUser;
