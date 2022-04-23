import React, {Component} from "react";
import Header from "../components/Header";
import TitleName from "../components/TitleName";
import ScrollButton from '../components/ScrollButton';
import {timezone} from "../index";
import Loader from "../components/Loader";
import {Link} from "react-router-dom";
import Cookies from "js-cookie";
import SpotifySong, {SpotifyAlbum} from "../components/SpotifyWidgets";

class NewsPage extends Component{
    constructor(props) {
        super(props);
        this.state = {
            error: null,
            isLoaded: false,
            item: null,
            recommendations: null,
            recommendations_error: null,
            recommendations_isLoaded: false,
            author_shorts: null,
            author_shorts_error: null,
            author_shorts_isLoaded: false,
            topTracks: [],
            topTracks_isLoaded: false,
            topTracks_error: null,
            id: props.match.params.id
        };
        this.content = null;
    }

    async componentDidMount() {
        await fetch("http://localhost:8000/api/news/" + this.state.id, {
            headers : {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Timezone': timezone
            }
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

        await fetch("http://localhost:8000/api/news/recommendations/" + this.state.item.title, {
            headers : {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Timezone': timezone
            }
        })
          .then(res => res.json())
          .then(
            (result) => {
                if (result.hasOwnProperty('detail')){
                    this.setState({
                    recommendations_isLoaded: true,
                    recommendations_error: result
                    });
                }else {
                    this.setState({
                        recommendations_isLoaded: true,
                        recommendations: result
                    });
                }
            },
            (error) => {
                this.setState({
                    recommendations_isLoaded: true,
                    error
                });
            }
          );
        await fetch("http://localhost:8000/api/news/recommendations/author/" + this.state.item.author.id,
    {
            headers : {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Timezone': timezone
            }
        })
          .then(res => res.json())
          .then(
            (result) => {
                if (result.hasOwnProperty('detail')){
                    this.setState({
                    author_shorts_isLoaded: true,
                    author_shorts_error: result
                    });
                }else {
                    this.setState({
                        author_shorts_isLoaded: true,
                        author_shorts: result
                    });
                }
            },
            (error) => {
                this.setState({
                    author_shorts: true,
                    error
                });
            }
          );

        const accessToken = Cookies.get('spotifyAuthToken')
        if (this.state.item.tags !== [] && accessToken) {
            await fetch(`https://api.spotify.com/v1/artists/${this.state.item.tags[0].spotify_id}/top-tracks?market=US`,
    {
            headers : {
                Authorization: "Bearer " + accessToken
            }
        })
          .then(res => res.json())
          .then(
            (result) => {
                if (result.hasOwnProperty('error')){
                    this.setState({
                        topTracks_isLoaded: true,
                        topTracks_error: result.error.message
                    })
                } else {
                    this.setState({
                        topTracks_isLoaded: true,
                        topTracks: result.tracks.map(item => (
                            {
                                id: item.id,
                                type: item.type
                            }
                        ))
                    })
                }
            }
          );
        }
    }

    renderWidget(item) {
        switch (item.type) {
            case 'track':
                return <SpotifySong key={Math.random().toString()} id={item.id} isLarge={false} isColorTheme={true}/>
            case 'album':
                return <SpotifyAlbum key={Math.random().toString()} id={item.id} isLarge={false}/>
            default:
                return undefined
        }
    }

    render() {
        const { error, isLoaded, item, recommendations, recommendations_error, recommendations_isLoaded,
        author_shorts, author_shorts_error, author_shorts_isLoaded, topTracks, topTracks_isLoaded, topTracks_error} = this.state;

        if (topTracks_error) {
          this.toptracks_block = <div>Error: {topTracks_error}</div>
        } else if (!topTracks_isLoaded) {
          this.toptracks_block = <Loader/>
        } else {
            this.toptracks_block =
            <div>
                <div style={{width: "700px"}}>
                    <div id="dl_screenshot" className="news-box">
                        <h3 style={{paddingLeft: "30%"}}>Tagged artists top track's</h3>
                        <br/>
                        {topTracks.slice(0, 6).map(item => (
                                this.renderWidget(item)))
                        }
                    </div>
                </div>
            </div>
        }

        if (author_shorts_error) {
          this.author_shorts = <div>Error: {author_shorts_error.detail}</div>
        } else if (!author_shorts_isLoaded) {
          this.author_shorts = <Loader/>
        } else {
            this.author_shorts =
            <div>
                <div style={{display: "flex", alignItems: "center", width: "700px"}}>
                    <div id="dl_screenshot" className="news-box">
                        <h3 style={{paddingLeft: "35%"}}>MORE FROM AUTHOR</h3>
                        <br/>
                        {author_shorts.map(news => (
                                    render_news(news, false, true)))
                            }
                    </div>
                </div>
            </div>
        }
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
                                {render_news(item)}
                            </React.Fragment>
                            {this.author_shorts}
                            {this.toptracks_block}
                        </div>
                    </div>
                </div>
        }
        if (recommendations_error) {
          this.recommendation = <div>Error: {recommendations_error.detail}</div>
        } else if (!recommendations_isLoaded) {
          this.recommendation = <Loader/>
        } else {
            this.recommendation =
                <div style={{width:"400px", marginTop: "30px", marginLeft: "80px", backgroundColor: "#fff"}}>
                    <div style={{height: "50px", width: "400px", display: "flex",
                        alignItems: "center", justifyContent: "center",
                        backgroundImage: "url(/images/writing_brush.png)",
                        backgroundPosition: "center",
                        backgroundSize: "contain",
                        backgroundRepeat: "no-repeat"}}>
                        <span>RECOMMENDATIONS</span>
                    </div>
                    <div>
                        <React.Fragment>
                            {recommendations.map(news => (
                                    render_news(news, true)))
                            }
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
                    <TitleName page_name="News"/>
                    <div style={{display: "flex", justifyContent: "center"}}>
                        {this.content}
                        {this.recommendation}
                    </div>
                    <ScrollButton/>
                </body>
            </div>
        );
    }
}

function render_news(news, is_recomm=false, is_short=false) {
    if (is_recomm) {
        let symbols_limit = 100;
        return (
        <div className="news-box" style={{ paddingLeft: "10px", borderBottom: "1px solid grey"}}>
            {/* eslint-disable-next-line jsx-a11y/img-redundant-alt */}
            <figure><img src={news.image} alt="News image"/></figure>
            <Link to={"/news/" + news.id} onClick={() => window.location.href= "/news/" + news.id}>
                <h3> {news.title} </h3>
            </Link>
            <p> {news.description.slice(0, symbols_limit)}... </p>
            <div className="row" style={{height: "30px", marginLeft: "0px"}}>
                <span> {news.create_datetime} <b>·</b> {news.author.username} </span>
            </div>
        </div>)
    } else
        if(is_short) {
            return (
                <div className="links" style={{ borderBottom: "1px solid lightgrey" }}>
                    <Link to={"/news/" + news.id} onClick={() => window.location.href= "/news/" + news.id}>
                        <p> {news.title} </p>
                    </Link>
                </div>
            )
    }
    let news_info;

    if(news.author.avatar){
        news_info =
            <span> {news.create_datetime} <b>·</b> {news.author.username}
                <img className="news_author_image" src={news.author.avatar} alt={''}/>
            </span>
    }else{
        news_info = <span> {news.create_datetime} <b>·</b> {news.author.username} </span>
    }
    return (
        <div className="news-box">
            {/* eslint-disable-next-line jsx-a11y/img-redundant-alt */}
            <figure><img src={news.image} alt="News image"/></figure>
            <h3> {news.title} </h3>
            <p> {news.description} </p>
            <div className="row" style={{height: "30px", marginLeft: "0px", marginRight: "0px", display: "flex",
                justifyContent: "space-between"}}>
                {news_info}
                <span>{!!(news.tags && news.tags.length > 0)? "Tags: ": null}
                    <React.Fragment>
                        {news.tags.map(tag => (
                            render_tag(tag)
                        ))}
                    </React.Fragment>
                </span>
            </div>
        </div>
    );
}

function render_tag(tag) {
    return (
        <Link to={"/artists/" + tag.id}>
            <img className="news_author_image" src={tag.image} alt={tag.pseudonym}/>
        </Link>
    );
}
export default NewsPage;
