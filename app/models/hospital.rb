class Hospital < ApplicationRecord
  belongs_to :area
  has_many :specialities
  has_many :hospital_specialities
  has_many :has_specialities, through: :Hospital_specialities, source: :speciality
end
