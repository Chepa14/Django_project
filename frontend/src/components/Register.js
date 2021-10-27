import React, {Component} from "react";

class Register extends Component{
    render() {
        return(
            <div className="container">
                <div className="col">
                    <div className="address">
                        <form action="" method="post">
                            <fieldset>
                                <div className="row">
                                    <div className="col-md-3 offset-md-4 form-group">
                                        <p>Username:</p>
                                        <input name="username" type="text"/>
                                    </div>
                                    <div className="col-md-3 offset-md-4 form-group">
                                        <p>Email:</p>
                                        <input name="email" type="text"/>
                                    </div>
                                    <div className="col-md-3 offset-md-4 form-group">
                                        <p>Password:</p>
                                        <input name="password1" type="password"/>
                                    </div>
                                    <div className="col-md-3 offset-md-4 form-group">
                                        <p>Confirm password:</p>
                                        <input name="password2" type="password"/>
                                    </div>
                                    <div className="col-sm-12 offset-md-5 form-actions">
                                        <button className="send" type="submit">Sign Up</button>
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

export default Register;
