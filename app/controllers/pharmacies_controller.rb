class PharmaciesController < InheritedResources::Base

  private

    def pharmacy_params
      params.require(:pharmacy).permit(:name, :area_id, :all_nigth, :googlemap_link, :number1, :number2)
    end

end
