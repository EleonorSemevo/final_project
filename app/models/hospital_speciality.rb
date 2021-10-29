class HospitalSpeciality < ApplicationRecord
  belongs_to :hospital
  belongs_to :speciality

  has_many :timetables, dependent: :delete_all
  accepts_nested_attributes_for :timetables,  allow_destroy: true, reject_if: :specialty_aleady_exist?

    def specialty_aleady_exist?(attributes)
      HospitalSpeciality.where(hospital_speciality_id: attributes['hospital_speciality_id'], hospital_id: attributes['hospital_id']).first.present?
    end
end
