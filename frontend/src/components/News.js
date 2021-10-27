import React, {Component} from "react";

class News extends Component{
    state = {
        news_list: [
            {
                "img": "https://img.theculturetrip.com/1440x807/smart/wp-content/uploads/2017/05/33109174793_876f731fe3_k.jpg",
                "title": "News #1",
                "date": "12-03-2021"
            },
            {
                "img": "https://img.theculturetrip.com/1440x807/smart/wp-content/uploads/2017/05/33109174793_876f731fe3_k.jpg",
                "title": "News #2",
                "date": "12-03-2021"
            },
            {
                "img": "https://img.theculturetrip.com/1440x807/smart/wp-content/uploads/2017/05/33109174793_876f731fe3_k.jpg",
                "title": "News #3",
                "date": "12-03-2021"
            }
        ]
    }

    render() {
        return(
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
                            {this.state.news_list.map(news => (
                                render_news(news)
                            ))}
                        </React.Fragment>
                    </div>
                </div>
            </div>
        );
    }
}

function render_news(news) {
    return(
        <div className="col-xl-4 col-lg-4 col-md-4 col-sm-12">
            <div className="news-box">
                <figure><img src={news.img} alt="img"/></figure>
                <h3> {news.title} </h3>
                <span> {news.date} </span>
                <span>Comment</span>
                <p>It is a long established fact that a reader will be distracted by the readable
                    content of a page when looking at its layout. The point of using Lorem Ipsum is that
                    it has a more-or-less normal distribution of letters, </p>
            </div>
        </div>
    );
}

export default News;
