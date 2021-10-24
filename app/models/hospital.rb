class Hospital < ApplicationRecord
  belongs_to :area
  # has_many :specialities
  # has_many :hospital_specialities
  has_many :specialities, through: :hospital_specialities, source: :speciality

  scope :search_name, ->(name){where('name like ?', name)}
  scope :search_area, ->(area_id){where('area_id = ?', area_id)}

   # has_many :timetables, through: :timetables, source: :hospital_speciality
   has_many :hospital_specialities


  # accepts_nested_attributes_for :timetables,  allow_destroy: true
  # accepts_nested_attributes_for :specialities,  allow_destroy: true
  accepts_nested_attributes_for :hospital_specialities, allow_destroy: true
end
