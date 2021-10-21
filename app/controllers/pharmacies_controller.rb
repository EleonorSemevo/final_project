class PharmaciesController < InheritedResources::Base

def index
  @pharmacies = Pharmacy.all
  if params[:pharmacy].present?
    name = params[:pharmacy][:name]
    area_id = params[:pharmacy][:area_id]
    town_id = params[:pharmacy][:town_id]
    if town_id !=""
      town = Area.find(town_id.to_i).town
    end

    if name !='' && area_id !='' && town_id != ''
      search_for_name_town_area_(name,area_id, town)
    elsif  name !='' && area_id !='' && town_id == ''
      search_for_name_area(name,area_id)
    elsif  name !='' && area_id =='' && town_id != ''
      search_name_town(name, town)
    elsif  name =='' && area_id !='' && town_id != ''
      search_area_town(area_id,town)
    elsif name !='' && area_id =='' && town_id == ''
      @pharmacies = Pharmacy.search_name(name)
     elsif name =='' && area_id !='' && town_id == ''
       @pharmacies = Pharmacy.search_area(area_id)
    elsif name =='' && area_id =='' && town_id != ''
      @pharmacies = search_for_town(town)
   end
 end
end

  private
    def search_for_name_town_area_(name,area_id, town)
      result = Pharmacy.search_name(name).search_area(area_id)
      interm = []
      # rechercher selon town
      result.each do |pharmacy|
         if pharmacy.area.town == town
           interm.push(pharmacy)
         end
      end
      @pharmacies = interm
    end

    def search_for_name_area(name,area_id)
      @pharmacies = Pharmacy.search_name(name).search_area(area_id)
    end

    def search_name_town(name, town)
      result = Pharmacy.search_name(name)
      interm = []
      # rechercher selon town
      result.each do |pharmacy|
         if pharmacy.area.town == town
           interm.push(pharmacy)
         end
      end
      @pharmacies = interm
    end

    def search_area_town(area_id,town)
      result = Pharmacy.search_area(area_id)
      interm = []
      # rechercher selon town
      result.each do |pharmacy|
         if pharmacy.area.town == town
           interm.push(pharmacy)
         end
      end
      @pharmacies = interm
    end

    def search_for_town(town)
      result = Pharmacy.all
      interm = []
      # rechercher selon town
      result.each do |pharmacy|
         if pharmacy.area.town == town
           interm.push(pharmacy)
         end
      end
      @pharmacies = interm
    end
    def pharmacy_params
      params.require(:pharmacy).permit(:name, :area_id, :all_nigth, :googlemap_link, :number1, :number2, :town_id)
    end

end
