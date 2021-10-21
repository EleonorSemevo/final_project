class Area < ApplicationRecord
  validates :name, presence:true
  validates :town, presence:true

  has_many :hospitals
  has_many :pharmacies
  has_many :blood_banks
end
