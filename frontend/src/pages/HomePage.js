import React, {Component} from "react";
import Footer from "../components/Footer";
import Header from "../components/Header";
import Artist from "../components/Artist";
import Banner from "../components/Banner";
import CentralBox from "../components/CentralBox";
import News from "../components/News";
import Albums from "../components/Albums";
import SpotifyAuthOverlay from "../components/SpotifyAuthOverlay";
import Cookies from "js-cookie";

class HomePage extends Component{
    constructor(props) {
        super(props);
        this.state = {
          isModal: typeof Cookies.get("spotifyAuthToken") !== 'undefined'
        };
        this.closeModal=this.closeModal.bind(this);
    }

    closeModal() {
        this.setState({
            isModal: true
        });
    }

    render() {
        const { isModal } = this.state;
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
                    {isModal ? null: (<SpotifyAuthOverlay onclick={this.closeModal}/>)}
                </body>
                <footer>
                    <Footer/>
                </footer>
            </div>
        );
    }
}

export default HomePage;
