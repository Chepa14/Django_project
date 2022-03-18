import React, {Component} from "react";
import Header from "../components/Header";
import TitleName from "../components/TitleName";
import ScrollButton from '../components/ScrollButton';
import {timezone} from "../index";
import Loader from "../components/Loader";
import {LikeButtonComponent} from "../components/LikeButtonComponent";

class ArtistPage extends Component{
    constructor(props) {
        super(props);
        this.state = {
            error: null,
            isLoaded: false,
            item: null,
            id: props.match.params.id
        };
        this.content = null;
    }

    async componentDidMount() {
        await fetch("http://localhost:8000/api/artists/" + this.state.id, {
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
                if (result.hasOwnProperty('detail')){
                    this.setState({
                    isLoaded: true,
                    error: result
                    });
                }else {
                    this.setState({
                        isLoaded: true,
                        item: result
                    });
                }
            },
            (error) => {
                this.setState({
                    isLoaded: true,
                    error
                });
            }
          );
    }

    render() {
        const { error, isLoaded, item} = this.state;
        if (error) {
          this.content = <div>Error: {error.detail}</div>
        } else if (!isLoaded) {
          this.content = <Loader/>
        } else {
            this.content =
                <div>
                    <div style={{display: "flex", alignItems: "center", width: "700px"}}>
                        <div id="dl_screenshot" className="Lastestnews_fpage">
                            <React.Fragment>
                                {render_artist(item)}
                            </React.Fragment>
                        </div>
                    </div>
                </div>

            // this.recommendation =
            //     <div style={{width:"300px", marginLeft: "50px", backgroundColor: "#fff", border: "1px solid grey"}}>
            //         <div style={{height: "50px", width: "300px", display: "flex",
            //             alignItems: "center", justifyContent: "center",
            //             backgroundImage: "url(/images/writing_brush.png)",
            //             backgroundPosition: "center",
            //             backgroundSize: "contain",
            //             backgroundRepeat: "no-repeat"}}>
            //             <span>RECOMMENDATION</span>
            //         </div>
            //         <div>
            //             <React.Fragment>
            //             </React.Fragment>
            //         </div>
            //     </div>
        }

        return (
            <div>
                <header>
                    <Header/>
                </header>
                <body>
                    <TitleName page_name="Artist"/>
                    <div style={{display: "flex", justifyContent: "center"}}>
                        {this.content}
                        {/*{this.recommendation}*/}
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
            {/* eslint-disable-next-line jsx-a11y/img-redundant-alt */}
            <figure><img src={artist.image} alt="News image"/></figure>
            <h3> {artist.pseudonym}</h3>
            <h5 style={{paddingLeft: "20px"}}> {artist.first_name + ' ' + artist.last_name} </h5> <br/>
            <p> {artist.description} </p>
            <div style={{paddingLeft: "20px"}}>
                <LikeButtonComponent likes_number={artist.likes_number}
                                     is_liked={artist.is_liked}
                                     artist_id={artist.id}/>
            </div>
        </div>
    );
}

export default ArtistPage;
