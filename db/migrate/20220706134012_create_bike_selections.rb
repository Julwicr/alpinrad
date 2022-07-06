class CreateBikeSelections < ActiveRecord::Migration[7.0]
  def change
    create_table :bike_selections do |t|
      t.references :booking, null: false, foreign_key: true
      t.references :bike, null: false, foreign_key: true

      t.timestamps
    end
  end
end
