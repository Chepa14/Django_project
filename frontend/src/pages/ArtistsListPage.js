import React, {Component} from "react";
import Header from "../components/Header";
import TitleName from "../components/TitleName";
import ScrollButton from '../components/ScrollButton';
import {timezone} from "../index";
import Loader from "../components/Loader";
import {LikeButtonComponent} from "../components/LikeButtonComponent";
import {Link} from "react-router-dom";

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
        await fetch("http://localhost:8000/api/artists/", {
            headers : {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Timezone': timezone,
            },
            credentials: 'include'
        })
          .then(res => res.json())
          .then(
            (result) => {
                this.setState({
                    isLoaded: true,
                    items: result
                });
            },
            (error) => {
                this.setState({
                    isLoaded: true,
                    error
                });
            }
          )
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
        <div className="news-box">
            <Link to={"/artists/" + artist.id}>
                {/* eslint-disable-next-line jsx-a11y/img-redundant-alt */}
                <figure><img src={artist.image} alt="News image"/></figure>
            </Link>
            <h3 style={{display: "flex", justifyContent: "space-between"}}> {artist.pseudonym}
                <LikeButtonComponent likes_number={artist.likes_number}
                                     is_liked={artist.is_liked}
                                     artist_id={artist.id}/>
            </h3>
        </div>
    );
}

export default ArtistsListPage;
