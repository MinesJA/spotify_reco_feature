class Song < ActiveRecord::Base
  has_many :album_songs
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs
  validates :name, uniqueness: true

end
