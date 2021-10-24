class Speciality < ApplicationRecord
  validates :name, presence:true

  has_many :hospitals, through: :Hospital_specialities, source: :hospital



  # has_many :hospitals_consult, through: :Hospital_specialities, source: :hospital
end
