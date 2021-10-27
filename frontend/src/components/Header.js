import React, { Component } from "react";
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Redirect,
  Link
} from "react-router-dom";
import LoginPage from "../pages/LoginPage";
import RegisterPage from "../pages/RegisterPage";
import HomePage from "../pages/HomePage";

class Header extends Component {
    render() {
        return (
            <div className="header">
                <div className="row">
                    <div className="container">
                        <div className="row">
                            <div className="col-xl-2 col-lg-2 col-md-2 col-sm-2 col logo_section">
                                <div className="full">
                                    <div className="center-desk">
                                        <div className="logo">
                                            {/* eslint-disable-next-line jsx-a11y/anchor-is-valid */}
                                            <a href="">
                                                <img width="50"
                                                     height="50"
                                                     src="https://iconsplace.com/wp-content/uploads/_icons/ffffff/256/png/music-icon-18-256.png"
                                                     alt="logo"/>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="col-xl-8 col-lg-8 col-md-10 col-sm-10">
                                <div className="menu-area">
                                    <div className="limit-box">
                                        <nav className="main-menu">
                                            <ul className="menu-area-main">
                                                <li><Link to="/">Home</Link></li>
                                                <li><Link to="/about">About</Link></li>
                                                <li><Link to="/news">News</Link></li>
                                                <li><Link to="/artists">Artists</Link></li>
                                                <li><Link to="/profile">Profile</Link></li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                            <div className="col-xl-2 col-lg-2 col-md-2 col-sm-2">
                                <form className="search">
                                    <input className="form-control" type="text" placeholder="Search"/>
                                        <button><img src="../images/search_icon.png" alt=""/></button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div style={{margin: "auto", width: "12%"}}>
                        <div className="menu-area">
                            <div className="limit-box">
                                <nav className="main-menu">
                                    <ul className="menu-area-main">
                                        <li><Link to="/login">Sign In</Link></li>
                                        <span>/</span>
                                        <li><Link to="/register">Sign Up</Link></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}

export default Header;
