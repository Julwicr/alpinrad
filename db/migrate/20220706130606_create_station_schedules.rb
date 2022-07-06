class CreateStationSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :station_schedules do |t|
      t.references :station, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
