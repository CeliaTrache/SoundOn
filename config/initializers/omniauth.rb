require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "<2f6e9a91424245a4ba492468eccc9ec3", "<51f213d73aa947e88ad9a7a886b233c7>", scope: 'playlist-read-collaborative playlist-modify-public user-library-read user-library-modify user-read-currently-playing streaming user-modify-playback-state'
end
