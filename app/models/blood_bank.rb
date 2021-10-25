class BloodBank < ApplicationRecord
  belongs_to :area

  scope :search_name, ->(name){where('name like ?', name)}
  scope :search_area, ->(area_id){where('area_id = ?', area_id)}

  has_many :blood_bank_insurances, dependent: :delete_all
  accepts_nested_attributes_for :blood_bank_insurances, allow_destroy: true
end
