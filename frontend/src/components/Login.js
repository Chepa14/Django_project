import React, { Component } from "react";

class Login extends Component {
    render(){
        return (
            <div className="container">
                <div className="col">
                    <div className="address">
                        <form action="." method="post">
                            <fieldset>
                                <div className="row">
                                    <div className="col-md-3 offset-md-4 form-group">
                                        <p>Username:</p>
                                        <input name="username" type="text"/>
                                    </div>
                                    <div className="col-md-3 offset-md-4 form-group">
                                        <p>Password:</p>
                                        <input name="password" type="password"/>
                                        <a href=""><p>Forgot your password?</p></a>
                                    </div>
                                    <div className="col-md-3 offset-md-5 form-actions">
                                        <button className="send" type="submit">Login</button>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        );
    }
}

export default Login;
