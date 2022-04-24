import React, {useState} from "react";
import {passwordChange} from "../requests/requests";

const PasswordChange = () => {
  const [password1, setPassword1] = useState('');
  const [password2, setPassword2] = useState('');

  const onSubmit = async e => {
    e.preventDefault();

    const passwords = {
      new_password1: password1,
      new_password2: password2
    };

    await passwordChange(passwords, localStorage.getItem('token'))
  };

    return(
        <div className="container">
            <div className="col">
                <div className="address">
                    <form onSubmit={onSubmit}>
                        <fieldset>
                            <div className="row">
                                <div className="col-md-3 offset-md-4 form-group">
                                    <p>New Password:</p>
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
                                    <input type='submit' value='Change password' />
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    );
}

export default PasswordChange;
