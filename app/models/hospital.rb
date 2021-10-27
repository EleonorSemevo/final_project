class Hospital < ApplicationRecord
  validates :name,  presence: true
  validates :area_id,  presence: true

  belongs_to :area
  has_many :specialities, through: :hospital_specialities, source: :speciality
  scope :search_name, ->(name){where('name like ?', name)}
  scope :search_area, ->(area_id){where('area_id = ?', area_id)}

 has_many :hospital_specialities, dependent: :delete_all
 has_many :hospital_insurances, dependent: :delete_all
 has_many :insurances, through: :hospital_insurances, source: :insurance
 has_many :specialities, through: :hospital_specialities, source: :speciality
accepts_nested_attributes_for :hospital_specialities, allow_destroy: true

  accepts_nested_attributes_for :hospital_insurances, allow_destroy: true
end
