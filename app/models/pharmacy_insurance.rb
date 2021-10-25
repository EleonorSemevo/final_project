class PharmacyInsurance < ApplicationRecord
  belongs_to :pharmacy
  belongs_to :insurance
end
