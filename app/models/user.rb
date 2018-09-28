class User < ActiveRecord::Base
  has_many :playlists
  has_many :songs, through: :playlists
  has_many :albums, through: :songs
  has_many :artists, through: :albums
  has_many :genres, through: :artists
  validates :name, uniqueness: true


  def sim(user)
    (self.songs & user.songs).count / (self.songs.count + user.songs.count)/2
  end

  def group_sims()
    

    User.all.map do |user|
      # Must be a way to avoid pulling ALL users to run these determine whether to include them in a particular users group or not

      perc_sim = self.sim(user)

      if perc_sim > 0.7 then user.id end
    end
  end


end
