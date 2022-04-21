import React, {Component} from "react";
import 'react-spotify-auth/dist/index.css'
import Cookies from "js-cookie";
import {SpotifyApiContext} from "react-spotify-api";
import {Scopes, SpotifyAuth} from "react-spotify-auth";

export const SpotiButton = () => {
    const [token, setToken] = React.useState(Cookies.get("spotifyAuthToken"))
  return (
    <div className='app'>
      {token ? (
        <SpotifyApiContext.Provider value={token}>
          {/* Your Spotify Code here */}
          <p>You are authorized with token: {token}</p>
        </SpotifyApiContext.Provider>
      ) : (
        <SpotifyAuth
          redirectUri='http://localhost:3000/clawback' //TODO add redirect to "localhost:3000/"
          clientID='508a7ef80a9243a2b513b7cea7fa7ead'  //TODO add it to env
          scopes={[Scopes.userReadPrivate, 'user-read-email']}
          onAccessToken={(token) => setToken(token)}
        />
      )}
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
                    <div style={{justifyContent: "center", alignItems: 'center', display: "flex", width: "100%"}}>
                        <SpotiButton/>
                    </div>
                </div>
            </div>
        );
    }
}

export default SpotifyAuthOverlay;
