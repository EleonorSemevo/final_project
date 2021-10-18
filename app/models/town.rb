class Town < ApplicationRecord
  validates :name, presence:true
  has_many :areas, dependent: :destroy
end
