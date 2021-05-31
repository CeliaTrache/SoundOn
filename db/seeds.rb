require 'rspotify'

Player.delete_all
TracksList.delete_all
Game.delete_all
User.delete_all
Playlist.delete_all
Track.delete_all

celia = User.create(first_name: "Celia", last_name: "Trache", email: "celiatrache@gmail.com", password: "azerfvbnjklo")


RSpotify.authenticate("2f6e9a91424245a4ba492468eccc9ec3", "51f213d73aa947e88ad9a7a886b233c7")

keywords = ['Funk & Soul Classics', 'Rock', 'Indie', 'Pop', 'Party', 'Happy', 'Chill', 'Electro']
playlists = []
keywords.each do |keyword|
  playlist = RSpotify::Playlist.search(keyword, limit: 1)
  playlists << playlist
end

puts "Launching playlists & tracks load"

playlists.each do |array|
  array.each do |playlist|
    title = playlist.name
    description = playlist.description
    image = playlist.images[0]["url"]
    number_of_songs = playlist.total
    spotify_id = playlist.id
    new_playlist = Playlist.create(title: title, songs_number: number_of_songs, description: description, image_url: image, spotify_id: spotify_id)
    puts "Playlist '#{playlist.name}' created successfully !"
  end
end

funk_playlist = playlists[0]
tracks = funk_playlist[0].tracks
tracks.each do |track|
  title = track.name
  artists = []
  track.artists.each do |artist|
    artists << artist.name
  end
  duration = track.duration_ms
  uri = track.uri
  id = track.id
  new_track = Track.create(title: title, artist: artists, duration: duration, spotify_id: id, spotify_url: uri)
end
puts "Playlist #{funk_playlist[0].name}'s tracks loaded successfully !"

