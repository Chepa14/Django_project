import React, { Component } from "react";

class TitleName extends Component{
    page_name;
    render() {
        return (
            <div className="contactbg">
                    <div className="container">
                        <div className="row">
                            <div className="col">
                                <div className="contacttitlepage">
                                    {/*<h2>Login</h2>*/}
                                    <h2>{this.props.page_name}</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        );
    }
}

export default TitleName;
