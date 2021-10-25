class InsurancesController < InheritedResources::Base

  private

    def insurance_params
      params.require(:insurance).permit(:name)
    end

end
