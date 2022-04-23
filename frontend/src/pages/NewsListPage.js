import React, {Component} from "react";
import Header from "../components/Header";
import TitleName from "../components/TitleName";
import ScrollButton from '../components/ScrollButton';
import {timezone} from "../index";
import {Link} from "react-router-dom";
import Loader from "../components/Loader";
import SpotifySong, {SpotifyAlbum} from "../components/SpotifyWidgets";
import Cookies from "js-cookie";


class NewsListPage extends Component{
    constructor(props) {
        super(props);
        this.state = {
          error: null,
          isLoaded: false,
          items: [],
          isLoadedAlbums: false,
          albums: [
              {
                  id: "5CnpZV3q5BcESefcB3WJmz",
                  type: 'albums',
              },
              {
                  id: "2QRedhP5RmKJiJ1i8VgDGR",
                  type: 'albums',
              },
              {
                  id: "7dAm8ShwJLFm9SaJ6Yc58O",
                  type: 'albums',
              },
              {
                  id: "2QRedhP5RmKJiJ1i8VgDGR",
                  type: 'albums',
              }
          ],
          albumsError: null
        };
        this.content = null;
    }

    async componentDidMount() {
        await fetch("http://localhost:8000/api/news/?limit=10", {
            headers : {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Timezone': timezone
            }
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
                    error: error
                });
            }
          )

        const accessToken = Cookies.get('spotifyAuthToken')
        if (accessToken) {
            await fetch('https://api.spotify.com/v1/browse/new-releases?limit=5', {
                headers: {
                    Authorization: "Bearer " + accessToken
                }
            })
                .then(res => res.json())
                .then(
                    (albums) => {
                        if (albums.hasOwnProperty('error')){
                            this.setState({
                                isLoadedAlbums: false,
                                albumsError: albums.error.message
                            })
                        } else {
                            this.setState({
                                isLoadedAlbums: false,
                                albums: albums.albums.items.map(item => (
                                    {
                                        id: item.id,
                                        type: item.type
                                    }
                                ))
                            })
                        }
                    })
        } else {
            await fetch('http://localhost:8000/api/releases/')
                .then(res => res.json())
                .then(
                    (albums) => {
                        if (albums.hasOwnProperty('error')){
                            this.setState({
                                isLoadedAlbums: false,
                                albumsError: albums.error.message
                            })
                        } else {
                            this.setState({
                                isLoadedAlbums: false,
                                albums: albums.albums.items.map(item => (
                                    {
                                        id: item.id,
                                        type: item.type
                                    }
                                ))
                            })
                        }
                    })
        }
    }

    renderWidget(item) {
        switch (item.type) {
            case 'single':
                return <SpotifySong key={Math.random().toString()} id={item.id} isLarge={false}/>
            case 'album':
                return <SpotifyAlbum key={Math.random().toString()} id={item.id} isLarge={true}/>
            default:
                return undefined
        }
    }

    render() {
        const { error, isLoaded, items, isLoadedAlbums, albums, albumsError } = this.state;
        const shuffled = [...items].sort(() => Math.random() - 0.5).reverse()
        if (error) {
          this.content = <div>Error: {error.message}</div>
        } else if (!isLoaded) {
          this.content = <Loader/>
        } else {
            this.content =
                <div>
                    <div style={{height: "50px", display: "flex", alignItems: "center", justifyContent: "center",
                        backgroundImage: "url(/images/writing_brush.png)",
                        backgroundPosition: "center",
                        backgroundSize: "contain",
                        backgroundRepeat: "no-repeat"}}>
                        <span>LATEST NEWS</span>
                    </div>
                    <div style={{display: "flex", alignItems: "center", width: "700px"}}>
                        <div id="dl_screenshot" className="Lastestnews_fpage">
                            <React.Fragment>
                                {items.map(news => (
                                    render_news(news)
                                ))}
                            </React.Fragment>
                        </div>
                    </div>
                </div>
        }
        this.recommendation =
            <div style={{width:"300px", marginLeft: "50px", backgroundColor: "#fff"}}>
                <div style={{height: "50px", width: "300px", display: "flex",
                    alignItems: "center", justifyContent: "center",
                    backgroundImage: "url(/images/writing_brush.png)",
                    backgroundPosition: "center",
                    backgroundSize: "contain",
                    backgroundRepeat: "no-repeat"}}>
                    <span>RECOMMENDATION</span>
                </div>
                <div style={{marginTop: "35px"}}>
                    <React.Fragment>
                            {shuffled.map(news => (
                                render_news(news, true)
                            ))}
                        </React.Fragment>
                </div>
                <div style={{marginTop: "50px"}}>
                    <div style={{height: "50px", width: "300px", display: "flex",
                        alignItems: "center", justifyContent: "center",
                        backgroundImage: "url(/images/writing_brush.png)",
                        backgroundPosition: "center",
                        backgroundSize: "contain",
                        backgroundRepeat: "no-repeat",
                        marginBottom: "20px"}}>
                        <span>FEATURED ALBUMS</span>
                    </div>
                    {isLoadedAlbums? <Loader/> :
                        albumsError? <div>Error: {error}</div> :
                            <div className="row">
                                <React.Fragment>
                                    {albums.map(item => (
                                        this.renderWidget(item)
                                    ))}
                                </React.Fragment>
                            </div>}
                </div>
            </div>

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

function render_news(news, is_recomm=false) {
    let symbols_limit = 444;
    if (is_recomm) {
        symbols_limit = 100;
        return (
        <div className="news-box" style={{ paddingLeft: "10px", borderBottom: "1px solid grey"}}>
            {/* eslint-disable-next-line jsx-a11y/img-redundant-alt */}
            <figure><img src={news.image} alt="News image"/></figure>
            <Link to={"/news/" + news.id}>
                <h3> {news.title} </h3>
            </Link>
            <p> {news.description.slice(0, symbols_limit)}... </p>
            <div className="row" style={{height: "30px", marginLeft: "0px"}}>
                <span> {news.create_datetime} <b>·</b> {news.author.username} </span>
            </div>
        </div>)
    }
    return (
        <div className="news-box">
            {/* eslint-disable-next-line jsx-a11y/img-redundant-alt */}
            <figure><img src={news.image} alt="News image"/></figure>
            <h3> {news.title} </h3>
            <p> {news.description.slice(0, symbols_limit)}... </p>
            <div className="row" style={{height: "30px", marginLeft: "0px", marginRight: "0px", display: "flex",
                justifyContent: "space-between"}}>
                <span> {news.create_datetime} <b>·</b> {news.author.username} </span>
                <span><Link to={"/news/" + news.id}>Read More</Link></span>
            </div>
        </div>
    );
}

export default NewsListPage;
