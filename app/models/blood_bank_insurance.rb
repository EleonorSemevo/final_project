class BloodBankInsurance < ApplicationRecord
  belongs_to :blood_bank
  belongs_to :insurance
end
