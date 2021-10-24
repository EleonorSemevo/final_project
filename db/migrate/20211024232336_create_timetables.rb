class CreateTimetables < ActiveRecord::Migration[5.2]
  def change
    create_table :timetables do |t|
      t.references :hospital_speciality, foreign_key: true
      t.string :day
      t.integer :start_hour
      t.integer :end_hour

      t.timestamps
    end
  end
end
