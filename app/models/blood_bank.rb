class BloodBank < ApplicationRecord
    validates :name,  presence: true
    validates :area_id,  presence: true

  belongs_to :area

  scope :search_name, ->(name){where('name like ?', name)}
  scope :search_area, ->(area_id){where('area_id = ?', area_id)}

  has_many :blood_bank_insurances, dependent: :delete_all
  #
has_many :insurances, through: :blood_bank_insurances, source: :insurance
  #
  accepts_nested_attributes_for :blood_bank_insurances, allow_destroy: true
end
