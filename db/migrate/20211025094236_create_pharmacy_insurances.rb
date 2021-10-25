class CreatePharmacyInsurances < ActiveRecord::Migration[5.2]
  def change
    create_table :pharmacy_insurances do |t|
      t.references :pharmacy, foreign_key: true
      t.references :insurance, foreign_key: true

      t.timestamps
    end
  end
end
