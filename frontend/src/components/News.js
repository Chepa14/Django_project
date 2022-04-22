import React, {Component} from "react";
import {timezone} from "../index";
import Loader from "./Loader";
import {Link} from "react-router-dom";

class News extends Component{
    constructor(props) {
        super(props);
        this.state = {
          error: null,
          isLoaded: false,
          items: []
        };
    }

    async componentDidMount() {
        await fetch("http://localhost:8000/api/news/?limit=3", {
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
          return <div>Error: {error.message}</div>;
        } else if (!isLoaded) {
          return <Loader/>
        } else {
            return (
                <div id="dl_screenshot" className="Lastestnews">
                    <div className="container">
                        <div className="row">
                            <div className="col-md-12">
                                <div className="titlepage">
                                    <h2>Latest News</h2>
                                    <span>
                                        It is a long established fact that a reader will be distracted by the readable
                                        <br/>
                                        content of a page when looking at its layout. The point of using Lorem
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div className="row">
                            <React.Fragment>
                                {items.map(news => (
                                    render_news(news)
                                ))}
                            </React.Fragment>
                        </div>
                    </div>
                </div>
            );
        }
    }
}

function render_news(news) {
    return(
        <div className="col-xl-4 col-lg-4 col-md-4 col-sm-12" key={Math.random().toString()}>
            <div className="news-box">
                <Link to={"/news/" + news.id}>
                    {/* eslint-disable-next-line jsx-a11y/img-redundant-alt */}
                    <figure><img src={news.image} alt="News image"/></figure>
                    <h3> {news.title} </h3>
                </Link>
                <span> {news.create_datetime} </span>
                <p> {news.description.slice(0, 444)}... </p>
            </div>
        </div>
    );
}

export default News;
