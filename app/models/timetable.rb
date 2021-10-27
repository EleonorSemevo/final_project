class Timetable < ApplicationRecord
  validates :day,  presence: true
  validates :start_hour,  presence: true
  validates :end_hour,  presence: true

  belongs_to :hospital_speciality
end
