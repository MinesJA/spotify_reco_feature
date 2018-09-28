class Genre < ActiveRecord::Base
  has_many :artists
  validates :name, uniqueness: true

end
