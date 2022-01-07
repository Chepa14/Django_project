import React, { useState, useEffect } from 'react';
import Cookies from 'js-cookie';
import {timezone} from "../index";
import { toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';


const Login = () => {
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        if (localStorage.getItem('token') !== null) {
          window.location.replace('http://localhost:3000/profile');
        } else {
          setLoading(false);
        }
    }, []);

    const onSubmit = e => {
        e.preventDefault();

        const user = {
          username: username,
          password: password
        };

        fetch('http://localhost:8000/auth/login/', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'X-CSRFToken': Cookies.get('csrftoken'),
            'Timezone': timezone
          },
          body: JSON.stringify(user)
        })
          .then(res => res.json())
          .then(data => {
            if (data.key) {
              localStorage.clear();
              localStorage.setItem('token', data.key);
              window.location.replace('http://localhost:3000/profile');
            } else {
              toast.warning("Cannot log in with provided credentials!");
              localStorage.clear();
            }
          });
    };

    return (
        <div className="container">
            <div className="col">
                <div className="address">
                  {loading === false && (
                    <form onSubmit={onSubmit}>
                        <fieldset>
                            <div className="row">
                                <div className="col-md-3 offset-md-4 form-group">
                                    <p>Username:</p>
                                    <input name='username'
                                        type='username'
                                        value={username}
                                        required
                                        onChange={e => setUsername(e.target.value)}/>
                                </div>
                                <div className="col-md-3 offset-md-4 form-group">
                                    <p>Password:</p>
                                    <input name='password'
                                        type='password'
                                        value={password}
                                        required
                                        onChange={e => setPassword(e.target.value)}/>
                                    {/* eslint-disable-next-line jsx-a11y/anchor-is-valid */}
                                    <a href=""><p>Forgot your password?</p></a> {/*TODO*/}
                                </div>
                                <div className="col-md-3 offset-md-5 form-actions">
                                    <input type='submit' value='Login' />
                                </div>
                            </div>
                        </fieldset>
                    </form>)}
                </div>
            </div>
        </div>
    );
}

export default Login;
