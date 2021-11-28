import React, {Component} from "react";
import Footer from "../components/Footer";
import Header from "../components/Header";
import Artist from "../components/Artist";
import Banner from "../components/Banner";
import CentralBox from "../components/CentralBox";
import News from "../components/News";
import Albums from "../components/Albums";

class HomePage extends Component{
    render() {
        return (
            <div>
                <header>
                    <Header/>
                </header>
                <body>
                    <Banner/>
                    <News/>
                    <CentralBox/>
                    <Artist/>
                    <Albums/>
                </body>
                <footer>
                    <Footer/>
                </footer>
            </div>
        );
    }
}

export default HomePage;
