import React, {Component} from "react";
import Header from "../components/Header";
import TitleName from "../components/TitleName";
import Register from "../components/Register";

class RegisterPage extends Component{
    render() {
        return (
            <div>
                <header>
                    <Header/>
                </header>
                <body>
                    <TitleName page_name="Registration"/>
                    <Register/>
                </body>
            </div>
        );
    }
}

export default RegisterPage;
