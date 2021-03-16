class AddCategoriesToLocations < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :categories, :string, array: true, default: []
  end
end
