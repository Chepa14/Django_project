import React, {Component} from "react";
class Banner extends Component{
    title = "";
    render() {
        return(
            <section className="banner_section">
                <div className="banner-main">
                    <img src="../images/Banner.jpg" alt=""/>
                    <div className="container">
                        <div className="text-bg relative">
                            <h1 className="glitch">
                                {/*{this.title}*/}
                                {/*<br/>*/}
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
