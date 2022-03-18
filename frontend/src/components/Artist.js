import React, { Component } from "react";
import {timezone} from "../index";

class Artist extends Component {
    constructor(props) {
        super(props);
        this.state = {
          error: null,
          isLoaded: false,
          items: []
        };
    }

  async componentDidMount() {
    await fetch("http://localhost:8000/api/artists/", {
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
      return <div>Loading...</div>;
    } else {
        return (
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
                            {items.slice(0, 3).map(artist => (
                                render_artist(artist)
                            ))}
                        </React.Fragment>
                    </div>
                </div>
            </div>
        );
        }
    }
}

function render_artist(artist) {
    return(
        <div className="col-xl-4 col-lg-4 col-md-4 col-sm-12">
            <div className="news-box">
                {/* eslint-disable-next-line jsx-a11y/img-redundant-alt */}
                <figure><img src={artist.image} alt="Artist's image"/></figure>
                <h3> {artist.pseudonym} </h3>
                <p> {artist.description.slice(0, 444)}... </p>
            </div>
        </div>
    );
}

export default Artist;
