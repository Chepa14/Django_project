import React, {Component} from "react";
import Header from "../components/Header";
import TitleName from "../components/TitleName";
import ScrollButton from '../components/ScrollButton';
import {timezone} from "../index";
import Loader from "../components/Loader";

class NewsPage extends Component{
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
                                {render_news(item)}
                            </React.Fragment>
                        </div>
                    </div>
                </div>

            this.recommendation =
                <div style={{width:"300px", marginLeft: "50px", backgroundColor: "#fff", border: "1px solid grey"}}>
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

function render_news(news) {
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
                <span>{!!(news.tags && news.tags.length > 0)? "Tags:": null}
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
        <img className="news_author_image" src={tag.image} alt={tag.pseudonym}/> //TODO add link to artist
    );
}
export default NewsPage;
