import React, { Component } from "react";
import SpotifySong from "./SpotifyWidgets";

class Footer extends Component{
    render() {
        return (
            <div className="footer">
                <div className="container">
                    <div className="row">
                        <div className="col-lg-3 col-md-6 col-sm-12 width">
                            <div className="address">
                                <h3>Contact Us</h3>
                                <ul className="locarion_icon">
                                    <li><img src="../icon/1.png" alt="icon"/>Kharkiv , Ukraine</li>
                                    <li><img src="../icon/2.png" alt="icon"/>Phone : ( +380 98323**** )
                                    </li>
                                    <li><img src="../icon/3.png" alt="icon"/>Email : ivanchepets14@gmail.com</li>
                                </ul>

                                <ul className="contant_icon">
                                    {/* eslint-disable-next-line jsx-a11y/anchor-is-valid */}
                                    <li><a href=""><img src="../icon/fb.png" alt="icon"/></a></li>
                                    {/* eslint-disable-next-line jsx-a11y/anchor-is-valid */}
                                    <li><a href=""><img src="../icon/tw.png" alt="icon"/></a></li>
                                    <li><a href="https://www.linkedin.com/in/ivan-chepets">
                                        <img src="../icon/lin(2).png" alt="icon"/></a></li>
                                    <li><a href="https://instagram.com/chepets_ivan/">
                                        <img src="../icon/instagram.png" alt="icon"/></a></li>
                                </ul>
                            </div>
                        </div>
                        <div className="col-lg-6 col-md-6 col-sm-12 width">
                            <div className="address">
                                <h3>Get In Touch</h3>
                                <form>
                                    <div className="row">
                                        <div className="col-sm-12">
                                            <input className="contactus" placeholder="Name" type="text" name="Name"/>
                                        </div>
                                        <div className="col-sm-12">
                                            <input className="contactus" placeholder="Phone" type="text"
                                                   name="Email"/>
                                        </div>
                                        <div className="col-sm-12">
                                            <input className="contactus" placeholder="Email" type="text"
                                                   name="Email"/>
                                        </div>
                                        <div className="col-sm-12">
                                            <textarea className="textarea" placeholder="Message"
                                                      type="text" name="Message"/>
                                        </div>
                                        <div className="col-sm-12">
                                            <button className="send">Send</button>
                                            {/*TODO Save responses to DB*/}
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div className="col-xl-3 col-lg-3 col-md-6 col-sm-12 width">
                            <div className="address">
                                <h3>New Music </h3>
                                <div className="row">
                                    {/*<div id="embed-iframe"></div>*/}
                                    <SpotifySong id="3KsS9NkC5ZlPAIWpGoL5Sx" isLarge={false}/>
                                    <SpotifySong id="0OyQns5ayNK2OVaES0Vb8t" isLarge={false}/>
                                    <SpotifySong id="7uDTc1eJwsD7iMZLhdp8LH" isLarge={false}/>
                                    <SpotifySong id="6MO2bfLHKykUgCChFdw91H" isLarge={false}/>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div className="copyright">
                    <p>© 2022 All Rights Reserved.</p>
                </div>
            </div>
        );
    }
}

export default Footer;
