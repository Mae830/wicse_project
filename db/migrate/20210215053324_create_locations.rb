class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :street1
      t.string :street2
      t.string :city
      t.string :zip

      t.timestamps
    end
  end
end
