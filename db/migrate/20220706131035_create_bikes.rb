class CreateBikes < ActiveRecord::Migration[7.0]
  def change
    create_enum :category, %i[mountain trekking eBike MTB]
    create_enum :size, %i[S M L XL]
    create_enum :state, %i[excellent good need_repair urgent_repair]

    create_table :bikes do |t|
      t.enum :category, enum_type: 'category'
      t.float :weight
      t.enum :size, enum_type: 'size'
      t.enum :state, enum_type: 'state'
      t.integer :price_per_day
      t.references :station, foreign_key: true

      t.timestamps
    end
  end
end
