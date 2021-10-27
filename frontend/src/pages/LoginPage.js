import React, {Component} from "react";
import Header from "../components/Header";
import TitleName from "../components/TitleName";
import Login from "../components/Login";

class HomePage extends Component{
    render() {
        return (
            <div>
                <header>
                    <Header/>
                </header>
                <body>
                    <TitleName page_name="Login"/>
                    <Login/>
                </body>
            </div>
        );
    }
}

export default HomePage;
