class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :latitude
      t.string :longitude
      t.string :name
      t.string :places_id
      t.string :category

      t.timestamps
    end
  end
end
