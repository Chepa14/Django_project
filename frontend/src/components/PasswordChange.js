import React, {useState} from "react";
import {passwordChange} from "../requests/requests";

const PasswordChange = () => {
  const [password1, setPassword1] = useState('');
  const [password2, setPassword2] = useState('');

  async function submit() {
    const passwords = {
      new_password1: password1,
      new_password2: password2
    };

    await passwordChange(passwords, localStorage.getItem('token'))
  }

    return(
        <div style={{display: "flex", justifyContent: "center", height: "auto", flexWrap: "wrap"}}>
                <fieldset>
                    <div>
                        <p>New Password:</p>
                        <input
                          className="fa"
                          style={{height: "30px", fontSize: "14px"}}
                          name='password1'
                          type='password'
                          value={password1}
                          onChange={e => setPassword1(e.target.value)}
                          placeholder="&#xf023;"
                          required/>
                    </div>
                    <div style={{paddingTop: "20px"}}>
                        <p>Confirm password:</p>
                        <input
                          className="fa"
                          style={{height: "30px", fontSize: "14px"}}
                          name='password2'
                          type='password'
                          value={password2}
                          onChange={e => setPassword2(e.target.value)}
                          placeholder="&#xf023;"
                          required/>
                    </div>
                    <div style={{display: "flex", justifyContent: "center", paddingTop: "20px"}}>
                        <button onClick={submit} className="send">Change password</button>
                    </div>
                </fieldset>
        </div>
    );
}

export default PasswordChange;
