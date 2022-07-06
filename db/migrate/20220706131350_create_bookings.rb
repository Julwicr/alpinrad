class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_enum :status, %i[ok cancel pending]

    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :station, null: false, foreign_key: true
      t.enum :status, enum_type: 'status', null: false, default: 'pending'
      t.integer :total_price
      t.date :date

      t.timestamps
    end
  end
end
