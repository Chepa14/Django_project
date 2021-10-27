import React, {Component} from "react";

class CentralBox extends Component{
    background_img = "https://wallpapers-hub.art/wallpaper-images/781042.jpg";

    render() {
        return(
            <div className="container-fluid">
                <div className="row">
                    <div className="col-xl-6 col-lg-12 col-md-12 col-sm-12 padding">
                        <div className="img-box">
                            <figure><img src={this.background_img} alt="img"/></figure>
                        </div>
                    </div>
                    <div className="col-xl-6 col-lg-12 col-md-12 col-sm-12 padding">
                        <div className="text-box">
                            <div className="box">
                                <i><img src="../images/5.png"/></i>
                                <h3>MEET OUR Music STARS</h3>
                                <p>It is a long established fact that a reader will be distracted by the readable
                                    <br/> content of a page when looking at its layout. The point of using Lorem</p>
                                <a href="#">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}

export default CentralBox;
