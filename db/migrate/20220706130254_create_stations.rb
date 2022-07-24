class CreateStations < ActiveRecord::Migration[7.0]
  def change
    create_enum :category, %i[dropoff pickup popup]

    create_table :stations do |t|
      t.string :name
      t.string :address
      t.integer :category
      t.text :description
      t.decimal :latitude
      t.decimal :longitude
      t.integer :bike_capacity
      t.boolean :shown, null: false, default: false

      t.timestamps
    end
  end
end
