import './App.css';
import './css/animate.min.css';
import './css/bootstrap.min.css';
// import './css/jquery.mCustomScrollbar.min.css';
// import './css/jquery-ui.css';
// import './css/meanmenu.css';
// import './css/nice-select.css';
// import './css/normalize.css';
// import './css/owl.carousel.min.css';
// import './css/slick.css';
// import './css/style.css';

import React from "react";
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from "react-router-dom";

function App() {
  return (
      <Router>
        <div>
        <nav>
          <ul>
            <li>
              <Link to="/">Home</Link>
            </li>
            <li>
              <Link to="/about">About</Link>
            </li>
            <li>
              <Link to="/users">Users</Link>
            </li>
          </ul>
        </nav>
        </div>

        <Switch>
          <Route path="/about">
            <About />
          </Route>
          <Route path="/users">
            <Users />
          </Route>
          <Route path="/">
            <Home />
          </Route>
        </Switch>
        </Router>
  );
}

export default App;
