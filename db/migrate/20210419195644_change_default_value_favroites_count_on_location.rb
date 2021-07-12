class ChangeDefaultValueFavroitesCountOnLocation < ActiveRecord::Migration[6.1]
  def change
    change_column :locations, :favorites_count, :integer, :default => 0
  end
end
