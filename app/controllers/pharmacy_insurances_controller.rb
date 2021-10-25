class PharmacyInsurancesController < InheritedResources::Base

  private

    def pharmacy_insurance_params
      params.require(:pharmacy_insurance).permit(:pharmacy_id, :insurance_id)
    end

end
