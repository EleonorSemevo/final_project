class BloodBankInsurancesController < InheritedResources::Base

  private

    def blood_bank_insurance_params
      params.require(:blood_bank_insurance).permit(:blood_bank_id, :insurance_id)
    end

end
