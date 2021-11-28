import React, {useState} from "react";
import Cookies from "js-cookie";

const PasswordChange = () => {
  const [password1, setPassword1] = useState('');
  const [password2, setPassword2] = useState('');

  const onSubmit = e => {
    e.preventDefault();

    const passwords = {
      new_password1: password1,
      new_password2: password2
    };

    fetch('http://localhost:8000/auth/change_password/', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Token ${localStorage.getItem('token')}`,
        'X-CSRFToken': Cookies.get('csrftoken')
      },
      credentials: 'include',
      body: JSON.stringify(passwords)
    }).then(()=> {
        window.location.replace('http://localhost:3000/');
    })
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
