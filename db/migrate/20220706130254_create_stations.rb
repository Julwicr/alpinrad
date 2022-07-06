class CreateStations < ActiveRecord::Migration[7.0]
  def change
    create_enum :category, %i[dropoff pickup popup]

    create_table :stations do |t|
      t.string :name
      t.string :address
      t.enum :category, enum_type: 'category'
      t.text :description
      t.decimal :latitude
      t.decimal :longitude
      t.integer :bike_capacity

      t.timestamps
    end
  end
end
