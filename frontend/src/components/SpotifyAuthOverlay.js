import React, {Component} from "react";
import 'react-spotify-auth/dist/index.css'
import {Scopes, SpotifyAuth} from "react-spotify-auth";

export const SpotiButton = () => {
  return (
    <div className='app'>
      <SpotifyAuth
          redirectUri='http://localhost:3000'
          clientID={process.env.REACT_APP_SPOTIFY_CLIENT_ID}
          scopes={[Scopes.userReadPrivate, 'user-read-email']}
          onAccessToken={(token)=>{window.location.href="/"}}
          title="Login with Spotify"/>
    </div>
  )
}

class SpotifyAuthOverlay extends Component{
    onclick;
    render() {
        return(
            <div className="SpotifyOverlay">
                <div className="authBox">
                    <button className="close" onClick={this.props.onclick}>&times;</button>
                    <div style={{justifyContent: "center", alignItems: 'center', display: "flex", width: "100%",
                        flexWrap: "wrap"}}>
                        <h1 style={{fontSize: "18px", width: "450px", color: "white", textAlign: "center"}}>
                            To provide a working maximum of our recommendation systems and get
                            the ability to listen to the songs, please login to Spotify:</h1>
                        <SpotiButton/>
                    </div>
                </div>
            </div>
        );
    }
}

export default SpotifyAuthOverlay;
