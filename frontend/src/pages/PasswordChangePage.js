import React, {Component} from "react";
import Header from "../components/Header";
import TitleName from "../components/TitleName";
import PasswordChange from "../components/PasswordChange";

class PasswordChangePage extends Component{
    render() {
        return (
            <div>
                <header>
                    <Header/>
                </header>
                <body>
                    <TitleName page_name="Password change"/>
                    <PasswordChange/>
                </body>
            </div>
        );
    }
}

export default PasswordChangePage;
