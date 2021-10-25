class CreateHospitalInsurances < ActiveRecord::Migration[5.2]
  def change
    create_table :hospital_insurances do |t|
      t.references :hospital, foreign_key: true
      t.references :insurance, foreign_key: true

      t.timestamps
    end
  end
end
