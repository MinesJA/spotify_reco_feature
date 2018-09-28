class Artist < ActiveRecord::Base
  belongs_to :genre
  has_many :album_artists
  has_many :albums, through: :album_artists
  has_many :songs, through: :albums
  validates :name, uniqueness: true

end
