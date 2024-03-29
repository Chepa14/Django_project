import React, {Component} from "react";
import Header from "../components/Header";
import TitleName from "../components/TitleName";
import ScrollButton from '../components/ScrollButton';
import Loader from "../components/Loader";
import {LikeButtonComponent} from "../components/LikeButtonComponent";
import {Link} from "react-router-dom";
import {getArtists} from "../requests/requests";

class ArtistsListPage extends Component{
    constructor(props) {
        super(props);
        this.state = {
          error: null,
          isLoaded: false,
          items: []
        };
        this.content = null;
    }

    async componentDidMount() {
        this.setState(await getArtists(10))
    }
    render() {
        const { error, isLoaded, items } = this.state;
        if (error) {
          this.content = <div>Error: {error.message}</div>
        } else if (!isLoaded) {
          this.content = <Loader/>
        } else {
            this.content =
                <div>
                    <div id="dl_screenshot" className="Lastestnews"
                         style={{display: "flex", justifyContent: "space-evenly", flexWrap: "wrap", gap: "30px"}}>
                        <React.Fragment>
                            {items.map(artists => (
                                render_artist(artists)
                            ))}
                        </React.Fragment>
                    </div>
                </div>
        }

        return (
            <div>
                <header>
                    <Header/>
                </header>
                <body>
                    <TitleName page_name="Artists"/>
                    <div style={{display: "flex", justifyContent: "center"}}>
                        {this.content}
                    </div>
                    <ScrollButton/>
                </body>
            </div>
        );
    }
}

function render_artist(artist) {
    return (
        <div className="news-box" style={{height: '350px'}}>
            <Link to={"/artists/" + artist.id}>
                {/* eslint-disable-next-line jsx-a11y/img-redundant-alt */}
                <figure><img src={artist.image} style={{height: "250px", width: "250px", objectFit: "cover"}}
                             alt="Artist image"/></figure>
            </Link>
            <h3 style={{display: "flex", justifyContent: "space-between", fontSize: "15px",
                paddingRight: "5px"}}> {artist.pseudonym}
                <LikeButtonComponent likes_number={artist.likes_number}
                                     is_liked={artist.is_liked}
                                     artist_id={artist.id}/>
            </h3>
        </div>
    );
}

export default ArtistsListPage;
