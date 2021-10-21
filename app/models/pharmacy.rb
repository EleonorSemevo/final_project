class Pharmacy < ApplicationRecord
  belongs_to :area

  scope :search_name, ->(name){where('name like ?', name)}
  scope :search_area, ->(area_id){where('area_id = ?', area_id)}
end
