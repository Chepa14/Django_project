import React, {Component} from "react";
import Header from "../components/Header";
import TitleName from "../components/TitleName";
import User from "../components/User";

class HomePage extends Component{
    render() {
        return (
            <div>
                <header>
                    <Header/>
                </header>
                <body>
                    <TitleName page_name="Profile"/>
                    <User/>
                </body>
            </div>
        );
    }
}

export default HomePage;
