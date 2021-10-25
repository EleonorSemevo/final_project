class CreateBloodBankInsurances < ActiveRecord::Migration[5.2]
  def change
    create_table :blood_bank_insurances do |t|
      t.references :blood_bank, foreign_key: true
      t.references :insurance, foreign_key: true

      t.timestamps
    end
  end
end
