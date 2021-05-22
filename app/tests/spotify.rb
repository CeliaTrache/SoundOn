require 'rspotify'

RSpotify.authenticate("2f6e9a91424245a4ba492468eccc9ec3", "51f213d73aa947e88ad9a7a886b233c7")

# celia = RSpotify::User.find('21qmhgd3whycge7hownsdhpea')

# p celia

# playlist = celia.playlists

# p playlist.class

playlists = RSpotify::Playlist.search('Indie')
    
playlist = playlists.first
p playlist.tracks.first.preview_url


