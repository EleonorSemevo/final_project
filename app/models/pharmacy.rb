class Pharmacy < ApplicationRecord
  validates :name,  presence: true
  validates :area_id,  presence: true



  belongs_to :area
  # has_many :insurances, through: :pharmacy_insurances, source: :insurance
  has_many :pharmacy_insurances, dependent: :delete_all
  accepts_nested_attributes_for :pharmacy_insurances, allow_destroy: true
  #
  has_many :insurances, through: :pharmacy_insurances, source: :insurance
  #

  scope :search_name, ->(name){where('name like ?', name)}
  scope :search_area, ->(area_id){where('area_id = ?', area_id)}
end
