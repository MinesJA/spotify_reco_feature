class Album < ActiveRecord::Base
  has_many :album_artists
  has_many :artists, through: :album_artists
  has_many :album_songs
  has_many :songs, through: :album_songs
  validates :name, uniqueness: true

end
