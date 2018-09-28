Genre.destroy_all
Artist.destroy_all
Album.destroy_all
Song.destroy_all
User.destroy_all
Playlist.destroy_all


10.times do
  genre = Genre.create(name: Faker::Music.unique.genre)
  puts "GENRE #{genre.name} created"

  10.times do
    artist = genre.artists.create(name: Faker::Music.unique.band)
    puts "ARTIST #{artist.name} created"

    3.times do
      album = artist.albums.create(name: Faker::Lorem.characters(10))

      puts "ALBUM #{album.name} created"

      10.times do
        song = album.songs.create(name: Faker::Lorem.characters(10))
        puts "SONG #{song.name} created"
      end
    end
  end
end

puts "Created #{Song.count} Song's"
puts "Created #{Album.count} Album's"
puts "Created #{Artist.count} Artist's"
puts "Created #{Genre.count} Genre's"

puts "=================================="

while User.count < 100 do
  user = User.create(name: Faker::Name.name)

  puts "USER #{user.name} created"
  while user.playlists.length < 5 do
    playlist = user.playlists.create(name: Faker::Lorem.characters(10))
    puts "playlist #{playlist.name} created"
    playlist.songs << Song.order("RANDOM()").limit(100)
  end


end


puts "Created #{User.count} User's"
puts "Created #{Playlist.count} Playlist's"

puts "=================================="

Faker::UniqueGenerator.clear
