class HospitalInsurancesController < InheritedResources::Base

  private

    def hospital_insurance_params
      params.require(:hospital_insurance).permit(:hospital_id, :insurance_id)
    end

end
