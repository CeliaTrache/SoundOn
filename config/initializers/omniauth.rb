require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "2f6e9a91424245a4ba492468eccc9ec3", "51f213d73aa947e88ad9a7a886b233c7", scope: 'user-read-email user-read-private streaming playlist-read-collaborative user-library-read user-library-modify user-read-currently-playing user-modify-playback-state user-read-playback-state playlist-modify-public playlist-modify-private playlist-read-private app-remote-control'
end
