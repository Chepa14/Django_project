import React, {Component} from "react";

class Banner extends Component{
    title = "";
    background_img = "https://www.birthplacemag.com/wp-content/uploads/2015/03/kendrick-lamar-pimp-butterfly.jpg";
    render() {
        return(
            <section className="banner_section">
                <div className="banner-main">
                    <img src={this.background_img} alt=""/>
                    <div className="container">
                        <div className="text-bg relative">
                            <h1>
                                {this.title}
                                <br/>
                                <span className="Perfect">THE PERFECT HIP-HOP MUSIC</span>
                            </h1>
                        </div>
                    </div>
                </div>
            </section>
        );
    }
}

export default Banner;
