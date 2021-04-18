class AddFavoritesCountToLocations < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :favorites_count, :integer
  end
end
