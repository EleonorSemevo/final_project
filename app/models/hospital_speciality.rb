class HospitalSpeciality < ApplicationRecord
  belongs_to :hospital
  belongs_to :speciality

  has_many :timetables, dependent: :delete_all
  accepts_nested_attributes_for :timetables,  allow_destroy: true
end
