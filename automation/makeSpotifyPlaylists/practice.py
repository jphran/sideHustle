import spotipy
from spotipy.oauth2 import SpotifyClientCredentials
import os
from credentials import clientID, secretID

#export auth id's
os.environ['SPOTIPY_CLIENT_ID'] = clientID
os.environ['SPOTIPY_CLIENT_SECRET'] = secretID

#store authentication
client_credentials_manager = SpotifyClientCredentials()
sp = spotipy.Spotify(client_credentials_manager=client_credentials_manager)

playlistBaseURL = 'https://api.spotify.com/v1'

playlist_id = '459JUCssv0Z2ZbC1AxPU6f' #warren's boy playlist
