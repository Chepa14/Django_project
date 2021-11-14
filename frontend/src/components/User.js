import React, {useEffect, useState} from "react";
import {Link} from "react-router-dom";
import Cookies from "js-cookie";

const User = () => {
    const [user, setUser] = useState({});
    const [loading, setLoading] = useState(true);
    const [first_name, setFirstname] = useState(null);
    const [last_name, setLastname] = useState(null);
    const [about, setAbout] = useState(null);
    const default_avatar = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnRFE3qvVvOoMsoGpAHPPr8bZVCOBIsrKDqNjsM8wo8DSwGCRSxzbQQmVVnPpiqZcxQ08&usqp=CAU';

    useEffect(() => {
        if (localStorage.getItem('token') == null) {
          window.location.replace('http://localhost:3000/login');
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
              setFirstname(data.first_name);
              setLastname(data.last_name);
              setAbout(data.about_me);
              setLoading(false);
            });
        }
    }, []);

    const onSubmit = e => {
        e.preventDefault();

        const user = {
          first_name: first_name,
          last_name: last_name,
          about_me: about
        };

        fetch('http://localhost:8000/api/user/', {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json',
            'Authorization': `Token ${localStorage.getItem('token')}`,
            'X-CSRFToken': Cookies.get('csrftoken'),
          },
          body: JSON.stringify(user),
          credentials: 'include'
        })
          .then(res => res.json())
          .then(data => {
            setUser(data);
            setLoading(false);
          });
    };

    return(
        <div className="container">
            {loading === false && (
            <div className="row">
                <div className="col">
                    <div className="address">
                        <form>
                            <div className="row">
                                <div style={{margin: "auto"}}>
                                    <img width="400" height="400" src={ user.avatar || default_avatar} alt=""/>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div className="col">
                    <div className="address">
                        <form onSubmit={onSubmit}>
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
                                           placeholder='  -'
                                           defaultValue={first_name}
                                           className="profile_input"
                                           onChange={e => setFirstname(e.target.value)}/>
                                </div>
                                <div className="col-sm-12">
                                    <p>Last Name:</p>
                                    <input type="text"
                                           placeholder='  -'
                                           defaultValue={last_name}
                                           className="profile_input"
                                           onChange={e => setLastname(e.target.value)}/>
                                </div>
                                <div className="col-sm-12">
                                    <p>About me:</p>
                                    <textarea className="textarea"
                                              placeholder="A couple of words..."
                                              defaultValue={about}
                                              onChange={e => setAbout(e.target.value)}/>
                                </div>
                                <div className="col-sm-12 offset-4">
                                    <input type='submit' value='Save'/>
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
