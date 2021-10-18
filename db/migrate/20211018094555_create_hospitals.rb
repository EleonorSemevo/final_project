class CreateHospitals < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.references :area, foreign_key: true
      t.boolean :public
      t.string :googlemap_link
      t.string :number1
      t.string :number2

      t.timestamps
    end
  end
end
