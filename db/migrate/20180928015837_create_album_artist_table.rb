class CreateAlbumArtistTable < ActiveRecord::Migration[5.2]
  def change
    create_table :album_artists do |t|
      t.integer :album_id
      t.integer :artist_id
    end
  end
end
