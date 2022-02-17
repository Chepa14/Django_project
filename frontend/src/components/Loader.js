import React, { Component } from "react";

class Loader extends Component{
    render() {
        return (
          <div className="loader_bg">
              <div className="loader"><img src="/images/loading.gif" alt="Loading"/></div>
          </div>
        );
    }
}

export default Loader;
