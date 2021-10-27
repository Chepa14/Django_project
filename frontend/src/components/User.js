import React, {Component} from "react";
import {Link} from "react-router-dom";

class User extends Component{

    state = {
        user: {
            "username": "i.chepets",
            "first_name": "Ivan",
            "last_name": "Chepets",
            "email": "i.chepets@email.com",
            "avatar": "https://cdn.shopify.com/s/files/1/2262/1373/files/WU-TANG-LOGO_3148x.png?v=1510278597",
            "about_me": "A few words about me..."
        },
        isLoggedIn: false
    }

    render() {
        if (!this.state.isLoggedIn){
            return (
                <div className="message-wrapper">
                    <div className="message">
                        <h2>You need to sign in!</h2>
                        <div className="menu-area">
                            <div className="limit-box">
                                <nav className="main-menu" style={{float: "none"}}>
                                    <ul className="menu-area-main cutom-li">
                                        <li><Link to="/login">Sign In</Link></li>
                                        <span>/</span>
                                        <li><Link to="/register">Sign Up</Link></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            );
        }
        return(
            <div className="container">
                <div className="row">
                    <div className="col">
                        <div className="address">
                            <form>
                                <div className="row">
                                    <div style={{margin: "auto"}}>
                                        <img width="400" height="400" src={ this.state.user.avatar } alt=""/>
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
                                        <h2> {this.state.user.username} </h2>
                                    </div>
                                    <div className="col-sm-12">
                                        <p>Email:</p>
                                        <h2> {this.state.user.email} </h2>
                                    </div>
                                    <div className="col-sm-12">
                                        <p>First Name:</p>
                                        <input type="text"
                                               defaultValue={this.state.user.first_name}
                                               className="profile_input"/>
                                    </div>
                                    <div className="col-sm-12">
                                        <p>Last Name:</p>
                                        <input type="text"
                                               defaultValue={this.state.user.last_name}
                                               className="profile_input"/>
                                    </div>
                                    <div className="col-sm-12">
                                        <p>About me:</p>
                                        <textarea className="textarea" placeholder="A couple of words..."
                                        defaultValue={this.state.user.about_me}/>
                                    </div>
                                    <div className="col-sm-12 offset-4">
                                        <button className="send">Save</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}

export default User;
