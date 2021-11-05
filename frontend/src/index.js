import React from 'react';
import ReactDOM from 'react-dom';
import 'bootstrap/dist/css/bootstrap.css';
import './index.css';

import './css/animate.min.css';
import './css/bootstrap.min.css';
import './css/jquery.mCustomScrollbar.min.css';
import './css/jquery-ui.css';
import './css/meanmenu.css';
import './css/nice-select.css';
import './css/normalize.css';
import './css/owl.carousel.min.css';
import './css/slick.css';
import './css/style.css';

import HomePage from './pages/HomePage';
import LoginPage from "./pages/LoginPage";
import RegisterPage from "./pages/RegisterPage";
import UserProfilePage from "./pages/UserProfilePage";

import reportWebVitals from './reportWebVitals';
import {BrowserRouter, Route, Switch} from "react-router-dom";
import Logout from "./components/Logout";

ReactDOM.render(
    <BrowserRouter>
        <Switch>
           <Route exact path="/" component={HomePage} />
           <Route path="/about" component={HomePage} />
           <Route path="/news" component={HomePage} />
           <Route path="/artists" component={HomePage} />
           <Route path="/profile" component={UserProfilePage} />
           <Route path="/login" component={LoginPage} />
           <Route path="/register" component={RegisterPage} />
           <Route path="/logout" component={Logout} />
        </Switch>
    </BrowserRouter>,
  document.getElementById('root')
);

reportWebVitals();
