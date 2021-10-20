class Area < ApplicationRecord
  validates :name, presence:true
  validates :town, presence:true

  has_many :hospitals
end
