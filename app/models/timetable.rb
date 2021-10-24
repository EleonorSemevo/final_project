class Timetable < ApplicationRecord
  belongs_to :hospital_speciality

  belongs_to :hospital
  belongs_to :speciality

  # accepts_nested_attributes_for :hospital_speciality,  allow_destroy: true
  # accepts_nested_attributes_for :speciality,  allow_destroy: true
end
