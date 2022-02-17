import React, {Component} from "react";
import Header from "../components/Header";
import TitleName from "../components/TitleName";
import ScrollButton from '../components/ScrollButton';
import {timezone} from "../index";
import {Link} from "react-router-dom";
import Loader from "../components/Loader";

class NewsListPage extends Component{
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
        await fetch("http://localhost:8000/api/news/", {
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
                <div>
                    <React.Fragment>
                            {items.map(news => (
                                render_news(news, true)
                            ))}
                        </React.Fragment>
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
        <div className="news-box">
            {/* eslint-disable-next-line jsx-a11y/img-redundant-alt */}
            <figure><img src={news.image} alt="News image"/></figure>
            <h3> {news.title} </h3>
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
