import React, { Component } from "react";
import loading from "../images/loading.gif";

class Loader extends Component{
    render() {
        return (
          <div className="loader_bg">
              <div className="loader"><img src={loading} alt="Loading"/></div>
          </div>
        );
    }
}

export default Loader;
