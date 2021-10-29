class Timetable < ApplicationRecord
  validates :day,  presence: true
  validates :start_hour,  presence: true
  validates :end_hour,  presence: true
  # array day: ['Lundi','Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche'] 

  belongs_to :hospital_speciality
end
