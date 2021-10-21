class CreatePharmacies < ActiveRecord::Migration[5.2]
  def change
    create_table :pharmacies do |t|
      t.string :name
      t.references :area, foreign_key: true
      t.boolean :all_nigth
      t.string :googlemap_link
      t.string :number1
      t.string :number2

      t.timestamps
    end
  end
end
