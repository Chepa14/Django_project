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
import Logout from "./components/Logout";
import PasswordChangePage from "./pages/PasswordChangePage";
import reportWebVitals from './reportWebVitals';
import {BrowserRouter, Route, Switch} from "react-router-dom";
import { ToastContainer } from 'react-toastify';


const timezone = Intl.DateTimeFormat().resolvedOptions().timeZone;

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
           <Route path="/change_password" component={PasswordChangePage} />
        </Switch>
        <ToastContainer
            position="top-right"
            autoClose={4000}
            hideProgressBar
            newestOnTop={false}
            closeOnClick
            rtl={false}
            pauseOnFocusLoss
            draggable
            pauseOnHover/>
    </BrowserRouter>,
  document.getElementById('root')
);

export {timezone};
reportWebVitals();
