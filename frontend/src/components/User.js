import React, {useEffect, useState} from "react";
import {Link} from "react-router-dom";
import Cookies from "js-cookie";

const User = () => {
    const [user, setUser] = useState({});
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        if (localStorage.getItem('token') == null) {
          window.location.replace('http://localhost:8000/login');
        } else {
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
              setLoading(false);
            });
        }
    }, []);

    return(
        <div className="container">
            {loading === false && (
            <div className="row">
                <div className="col">
                    <div className="address">
                        <form>
                            <div className="row">
                                <div style={{margin: "auto"}}>
                                    <img width="400" height="400" src={ user.avatar } alt=""/>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div className="col">
                    <div className="address">
                        <form>
                            <div className="row">
                                <div className="col-sm-12">
                                    <p>Username:</p>
                                    <h2> {user.username} </h2>
                                </div>
                                <div className="col-sm-12">
                                    <p>Email:</p>
                                    <h2> {user.email} </h2>
                                </div>
                                <div className="col-sm-12">
                                    <p>First Name:</p>
                                    <input type="text"
                                           defaultValue={user.first_name}
                                           className="profile_input"/>
                                </div>
                                <div className="col-sm-12">
                                    <p>Last Name:</p>
                                    <input type="text"
                                           defaultValue={user.last_name}
                                           className="profile_input"/>
                                </div>
                                <div className="col-sm-12">
                                    <p>About me:</p>
                                    <textarea className="textarea" placeholder="A couple of words..."
                                    defaultValue={user.about_me}/>
                                </div>
                                <div className="col-sm-12 offset-4">
                                    <Link to="/logout"> Save </Link>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>)}
        </div>
    );
}

export default User;
