class AddRatingToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :rating, :integer
  end
end
