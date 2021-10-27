import React, { Component } from "react";

class Artist extends Component {
    state = {
      artist_list: [
          {
              "img": "https://img.theculturetrip.com/1440x807/smart/wp-content/uploads/2017/05/33109174793_876f731fe3_k.jpg",
              "pseudonym": "Artist #1",
              "desc": "A few words about me..."
          },
          {
              "img": "https://img.theculturetrip.com/1440x807/smart/wp-content/uploads/2017/05/33109174793_876f731fe3_k.jpg",
              "pseudonym": "Artist #2",
              "desc": "A few words about me..."
          },
          {
              "img": "https://img.theculturetrip.com/1440x807/smart/wp-content/uploads/2017/05/33109174793_876f731fe3_k.jpg",
              "pseudonym": "Artist #3",
              "desc": "A few words about me..."
          },
          {
              "img": "https://img.theculturetrip.com/1440x807/smart/wp-content/uploads/2017/05/33109174793_876f731fe3_k.jpg",
              "pseudonym": "Artist #4",
              "desc": "A few words about me..."
          }
      ]
    };

    render() {
        return(
            <div className="Lastestnews">
                <div className="container">
                    <div className="row">
                        <div className="col-md-12">
                            <div className="titlepage">
                                <h2>Popular Artists</h2>
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
                            {this.state.artist_list.map(artist => (
                                render_artist(artist)
                            ))}
                        </React.Fragment>
                    </div>
                </div>
            </div>
        );
    }
}

function render_artist(artist) {
    return(
        <div className="col-xl-3 col-lg-3 col-md-6 col-sm-12">
            <div className="for-box">
                <i><img src={artist.img} alt="icon"/></i>
                <h3>{artist.pseudonym}</h3>
                <p>{artist.desc}</p>
            </div>
        </div>
    );
}

export default Artist;
