import os
from spotipy import Spotify
from spotipy.oauth2 import SpotifyClientCredentials


def get_new_releases(limit=4):
    sp = Spotify(
        auth_manager=SpotifyClientCredentials(
            client_id=os.environ.get('SPOTIFY_CLIENT_ID', ''),
            client_secret=os.environ.get('SPOTIFY_CLIENT_SECRET', '')
        ))
    return sp.new_releases(limit=limit)
