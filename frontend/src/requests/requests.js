import {timezone} from "../index";
import Cookies from "js-cookie";
import {toast} from "react-toastify";
import {local_backend_url, local_frontend_url} from "./constants";

const releasesTypes = [
    {
        isLoading: true,
        error: null,
        items: []
    },
    {
        isLoadedAlbums: true,
        albums: [
              {
                  id: "5CnpZV3q5BcESefcB3WJmz",
                  type: 'albums',
              },
              {
                  id: "2QRedhP5RmKJiJ1i8VgDGR",
                  type: 'albums',
              },
              {
                  id: "7dAm8ShwJLFm9SaJ6Yc58O",
                  type: 'albums',
              },
              {
                  id: "2QRedhP5RmKJiJ1i8VgDGR",
                  type: 'albums',
              }
      ],
        albumsError: null
    }
]

export async function getNewReleases(accessToken, type, limit=5) {
    let result = JSON.parse(JSON.stringify(releasesTypes[type]))
    await fetch('https://api.spotify.com/v1/browse/new-releases?limit=' + limit, {
                headers: {
                    Authorization: "Bearer " + accessToken
                }
            })
                .then(res => res.json())
                .then(
                    (albums) => {
                        if (albums.hasOwnProperty('error')){
                            switch (type) {
                                case 0:
                                    result.isLoading = false
                                    result.error = albums.error.message
                                    break
                                case 1:
                                    result.isLoadedAlbums = false
                                    result.albumsError = albums.error.message
                                    break
                                default:
                                    break
                            }
                        } else {
                            switch (type) {
                                case 0:
                                    result.isLoading = false
                                    result.items = albums.albums.items.map(item => (
                                            {
                                                id: item.id,
                                                type: item.type
                                            }
                                        ))
                                    break
                                case 1:
                                    result.isLoadedAlbums = false
                                    result.albums = albums.albums.items.map(item => (
                                            {
                                                id: item.id,
                                                type: item.type
                                            }
                                        ))
                                    break
                                default:
                                    break
                            }
                        }
                    })
    return result
}

export async function getNewReleasesFromBackend(type) {
    let result = JSON.parse(JSON.stringify(releasesTypes[type]))


    await fetch(`${local_backend_url}/api/releases/`)
                .then(res => res.json())
                .then(
                    (albums) => {
                        if (albums.hasOwnProperty('error')){
                            switch (type) {
                                case 0:
                                    result.isLoading = false
                                    result.error = albums.error.message
                                    break
                                case 1:
                                    result.isLoadedAlbums = false
                                    result.albumsError = albums.error.message
                                    break
                                default:
                                    break
                            }
                        } else {
                            switch (type) {
                                case 0:
                                    result.isLoading = false
                                    result.items = albums.albums.items.map(item => (
                                            {
                                                id: item.id,
                                                type: item.type
                                            }
                                        ))
                                    break
                                case 1:
                                    result.isLoadedAlbums = false
                                    result.albums = albums.albums.items.map(item => (
                                            {
                                                id: item.id,
                                                type: item.type
                                            }
                                        ))
                                    break
                                default:
                                    break
                            }
                        }
                    })
    return result
}

export async function getLastNews(type, limit=10) {
    let result = {
        isLoaded: false,
        error: null,
        items: []
    }
    await fetch(`${local_backend_url}/api/news/?limit=${limit}`, {
            headers : {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Timezone': timezone
            }
        })
          .then(res => res.json())
          .then(
            (news) => {
                result.isLoaded = true
                result.items = news
            },
            (error) => {
                result.isLoaded = true
                result.error = error
            }
          )
    return result
}

export async function getNewsByID(id) {
    let result = {
        isLoaded: false,
        error: null,
        item: null
    }
    await fetch(`${local_backend_url}/api/news/${id}`, {
            headers : {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Timezone': timezone
            }
        })
          .then(res => res.json())
          .then(
            (news) => {
                if (news.hasOwnProperty('detail')){
                    result.isLoaded = true
                    result.error = news
                }else {
                    result.isLoaded = true
                    result.item = news
                }
            }
          );
    return result
}

export async function getRecommendationByTitle(title) {
    let result = {
        recommendations_isLoaded: false,
        recommendations_error: null,
        recommendations: []
    }
    await fetch(`${local_backend_url}/api/news/recommendations/${title}`, {
            headers : {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Timezone': timezone
            }
        })
          .then(res => res.json())
          .then(
            (news) => {
                if (news.hasOwnProperty('detail')){
                    result.recommendations_isLoaded = true
                    result.recommendations_error = news
                }else {
                    result.recommendations_isLoaded = true
                    result.recommendations = news
                }
            },
          );
    return result
}

export async function getRecommendationByAuthor(id) {
    let result = {
        author_shorts_isLoaded: false,
        author_shorts_error: null,
        author_shorts: []
    }
    await fetch(`${local_backend_url}/api/news/recommendations/author/${id}`,
    {
            headers : {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Timezone': timezone
            }
        })
          .then(res => res.json())
          .then(
            (news) => {
                if (news.hasOwnProperty('detail')){
                    result.author_shorts_isLoaded = true
                    result.author_shorts_error = news
                }else {
                    result.author_shorts_isLoaded = true
                    result.author_shorts = news
                }
            }
          );
    return result
}

export async function getArtistTopTracks(accessToken, id) {
    let result = {
        topTracks: [],
        topTracks_isLoaded: false,
        topTracks_error: null,
    }
    await fetch(`https://api.spotify.com/v1/artists/${id}/top-tracks?market=US`,
    {
            headers : {
                Authorization: "Bearer " + accessToken
            }
        })
          .then(res => res.json())
          .then(
            (tracks) => {
                if (tracks.hasOwnProperty('error')){
                    result.topTracks_isLoaded = true
                    result.topTracks_error = tracks.error.message
                } else {
                    result.topTracks_isLoaded = true
                    result.topTracks = tracks.tracks.map(item => (
                            {
                                id: item.id,
                                type: item.type
                            }
                        ))
                }
            }
          )
    return result
}

export async function getArtistRecommendations(limit=3) {
    let result = {
        error: null,
        isLoaded: false,
        items: []
    }
    await fetch(`${local_backend_url}/api/artists/recommendation/likes/${limit}`, {
      headers : {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Timezone': timezone
       }
    })
      .then(res => res.json())
      .then(
        (artists) => {
            result.isLoaded = true
            result.items = artists
        }
      )
    return result
}

export async function getArtists(limit= 10) {
    let result = {
        error: null,
        isLoaded: false,
        items: []
    }
    await fetch(`${local_backend_url}/api/artists/`, {
        headers : {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Timezone': timezone,
        },
        credentials: 'include'
        })
          .then(res => res.json())
          .then(
            (artists) => {
                if (artists.hasOwnProperty('detail')){
                    result.isLoaded = true
                    result.error = artists
                } else {
                    result.isLoaded = true
                    result.items = artists
                }
            }
          )
    return result
}

export async function getArtistByID(id) {
    let result = {
        error: null,
        isLoaded: false,
        item: null
    }
    await fetch(`${local_backend_url}/api/artists/${id}`, {
        headers : {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Timezone': timezone,
        },
        credentials: 'include'
        })
          .then(res => res.json())
          .then(
            (artist) => {
                if (artist.hasOwnProperty('detail')){
                    result.isLoaded = true
                    result.error = artist
                }else {
                    result.isLoaded = true
                    result.item = artist
                }
            }
          )
    return result
}

export async function getCurrentUser(token) {
    let user = {}
    await fetch(`${local_backend_url}/api/user/`, {
        headers: {
          "Content-Type": "application/json",
          'Authorization': `Token ${token}`,
          'X-CSRFToken': Cookies.get('csrftoken')
        },
        credentials: 'include'
      })
        .then(res => res.json())
        .then((result) => {
          if (result.hasOwnProperty('detail')){
              localStorage.clear();
              window.location.replace(`${local_frontend_url}/login`);
          } else {
              user = result
          }
        })
    return user
}

export async function updateUser(data, token) {
    let user = {}
    fetch(`${local_backend_url}/api/user/`, {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json',
            'Authorization': `Token ${token}`,
            'X-CSRFToken': Cookies.get('csrftoken'),
        },
        body: JSON.stringify(data),
        credentials: 'include'
    })
        .then(res => res.json())
        .then(data => {
            user = data
        });
    return user
}

export async function updateUserImage(formData, token) {
    let user = {}
    await fetch(`${local_backend_url}/api/user/`, {
        method: 'PATCH',
        headers: {
            'Authorization': `Token ${token}`,
            'X-CSRFToken': Cookies.get('csrftoken'),
        },
        body: formData,
        credentials: 'include'
    })
        .then(res => res.json())
        .then(data => {
            user = data
        });
    return user
}

export async function login(user) {
    await fetch(`${local_backend_url}/auth/login/`, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'X-CSRFToken': Cookies.get('csrftoken'),
            'Timezone': timezone
          },
          body: JSON.stringify(user),
          credentials: "include"
        })
          .then(res => res.json())
          .then(data => {
            if (data.key) {
              localStorage.setItem('token', data.key);
              window.location.replace(`${local_frontend_url}/profile`);
            } else {
              toast.warning("Cannot log in with provided credentials!");
            }
          });
}

export async function logout(token) {
    await fetch(`${local_backend_url}/auth/logout/`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: `Token ${token}`
      },
      credentials: "include"
    })
      .then(res => res.json())
      .then(data => {
        localStorage.clear();
        window.location.replace(`${local_frontend_url}/login`);
      });
}

export async function register(user) {
    await fetch(`${local_backend_url}/auth/registration/`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Timezone': timezone
      },
      body: JSON.stringify(user)
      })
        .then(res => {
           if(res.ok){
               res.json().then(data => toast.success(data.detail));
           }else{
               toast.error(res.statusText);
           }
        });
}

export async function passwordChange(passwords, token) {
    await fetch(`${local_backend_url}/auth/change_password/`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Token ${token}`,
        'X-CSRFToken': Cookies.get('csrftoken')
      },
      credentials: 'include',
      body: JSON.stringify(passwords)
    }).then(()=> {
        window.location.replace(`${local_frontend_url}/`);
    })
}

export async function setCurrentSpotifyUserID(token) {
    await fetch('https://api.spotify.com/v1/me', {
          headers: {
              Authorization: "Bearer " + token
          }
      })
          .then(res => res.json())
          .then((result) => {
              Cookies.set('SpotifyUserID', result.id)
          })
}
