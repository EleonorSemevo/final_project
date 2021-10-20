class CreateHospitalSpecialities < ActiveRecord::Migration[5.2]
  def change
    create_table :hospital_specialities do |t|
      t.references :hospital, foreign_key: true
      t.references :speciality, foreign_key: true

      t.timestamps
    end
  end
end
