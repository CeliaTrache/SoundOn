require 'rspotify'

RSpotify.authenticate("2f6e9a91424245a4ba492468eccc9ec3", "51f213d73aa947e88ad9a7a886b233c7")

# julien = RSpotify::User.find('21qmhgd3whycge7hownsdhpea')

# PLAYLIST API TEST
playlists = RSpotify::Playlist.search('Indie')

playlist = playlists.first
puts "Playlist name : #{playlist.name}"
puts "Playlist description : #{playlist.description}"
puts "Number of songs : #{playlist.total}"
puts "Image link : #{playlist.images[0]["url"]}"
puts "Spotify ID : #{playlist.id}"

puts "-------"

# TRACKS API TEST
first_track = playlist.tracks.first
puts "Track name : #{first_track.name}"
artists = []
first_track.artists.each do |artist|
  artists << artist.name
end
puts "Track artist : #{artists}"
puts "Duration : #{first_track.duration_ms} ms"
puts "Spotify URI : #{first_track.uri}"
