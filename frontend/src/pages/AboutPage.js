import React, {Component} from "react";
import Footer from "../components/Footer";
import Header from "../components/Header";
import TitleName from "../components/TitleName";
import About from "../components/About";

class AboutPage extends Component{
    render() {
        return (
            <div>
                <header>
                    <Header/>
                </header>
                <body>
                    <TitleName page_name="About"/>
                    <About/>
                </body>
                <footer>
                    <Footer/>
                </footer>
            </div>
        );
    }
}

export default AboutPage;
