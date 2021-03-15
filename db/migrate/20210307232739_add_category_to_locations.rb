class AddCategoryToLocations < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :category, :integer
  end
end
