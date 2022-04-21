import React, { Component } from "react";

class SpotifySong extends Component{
    isLarge;
    id;

    render() { //TODO add gradient on hover (like at main page of spotify)
        return (
            <div style={{margin: "0px 0px 5px 10px"}}>
                {/* eslint-disable-next-line jsx-a11y/iframe-has-title */}
                <iframe style={{ borderRadius: "12px", width:"100%", height: (this.props.isLarge) ? "380px": "80px"}}
                        allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture"
                        src={"https://open.spotify.com/embed/track/" + this.props.id + "?utm_source=generator&theme=0"}>
                </iframe>
            </div>
        );
    }
}

export class SpotifyAlbum extends Component{
    isLarge;
    id;

    render() {
        return (
            <div style={{margin: "0px 0px 5px 10px"}}>
                {/* eslint-disable-next-line jsx-a11y/iframe-has-title */}
                <iframe style={{ borderRadius: "12px", width:"100%", height: (this.props.isLarge) ? "380px": "80px"}}
                        allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture"
                        src={"https://open.spotify.com/embed/album/" + this.props.id + "?utm_source=generator"}>
                </iframe>
            </div>
        );
    }
}

export default SpotifySong;
