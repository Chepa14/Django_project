import React, {useState} from "react";
import 'react-toastify/dist/ReactToastify.css';
import {register} from "../requests/requests";

const Register = () => {
  const [username, setUsername] = useState('');
  const [email, setEmail] = useState('');
  const [password1, setPassword1] = useState('');
  const [password2, setPassword2] = useState('');

  const onSubmit = async e => {
    e.preventDefault();

    const user = {
      username: username,
      email: email,
      password1: password1,
      password2: password2
    };

    await register(user)
  };

    return(
        <div className="container">
            <div className="col">
                <div className="address">
                    <form onSubmit={onSubmit}>
                        <fieldset>
                            <div className="row">
                                <div className="col-md-3 offset-md-4 form-group">
                                    <p>Username:</p>
                                    <input name='username'
                                      type='username'
                                      value={username}
                                      onChange={e => setUsername(e.target.value)}
                                      required/>
                                </div>
                                <div className="col-md-3 offset-md-4 form-group">
                                    <p>Email:</p>
                                    <input name='email'
                                      type='email'
                                      value={email}
                                      onChange={e => setEmail(e.target.value)}
                                      required/>
                                </div>
                                <div className="col-md-3 offset-md-4 form-group">
                                    <p>Password:</p>
                                    <input name='password1'
                                      type='password'
                                      value={password1}
                                      onChange={e => setPassword1(e.target.value)}
                                      required/>
                                </div>
                                <div className="col-md-3 offset-md-4 form-group">
                                    <p>Confirm password:</p>
                                    <input name='password2'
                                      type='password'
                                      value={password2}
                                      onChange={e => setPassword2(e.target.value)}
                                      required/>
                                </div>
                                <div className="col-sm-12 offset-md-5 form-actions">
                                    <input type='submit' value='Signup' />
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    );
}

export default Register;
