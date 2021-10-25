class HospitalInsurance < ApplicationRecord
  belongs_to :hospital
  belongs_to :insurance
end
