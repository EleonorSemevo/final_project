class BloodBanksController < InheritedResources::Base

  def index
    @comments = Comment.all
    @comment = Comment.new
    @blood_banks = BloodBank.all
    if params[:blood_bank].present?
      name = params[:blood_bank][:name]
      area_id = params[:blood_bank][:area_id]
      town_id = params[:blood_bank][:town_id]
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
        @blood_banks = BloodBank.search_name(name)
       elsif name =='' && area_id !='' && town_id == ''
         @blood_banks = BloodBank.search_area(area_id)
      elsif name =='' && area_id =='' && town_id != ''
        @blood_banks = search_for_town(town)
     end
    end

    if @blood_banks.class == Array
      @blood_banks = Kaminari.paginate_array(@blood_banks).page(15).per(1)
    else
      @blood_banks = @blood_banks.page(params[:page]).per(15)
    end
  end

  private
  def search_for_name_town_area_(name,area_id, town)
    result = BloodBank.search_name(name).search_area(area_id)
    interm = []
    # rechercher selon town
    result.each do |blood_bank|
       if pharmacy.area.town == town
         interm.push(pharmacy)
       end
    end
    @blood_banks = interm
  end

  def search_for_name_area(name,area_id)
    @blood_banks = BloodBank.search_name(name).search_area(area_id)
  end

  def search_name_town(name, town)
    result = BloodBank.search_name(name)
    interm = []
    # rechercher selon town
    result.each do |pharmacy|
       if pharmacy.area.town == town
         interm.push(pharmacy)
       end
    end
    @blood_banks = interm
  end

  def search_area_town(area_id,town)
    result = BloodBank.search_area(area_id)
    interm = []
    # rechercher selon town
    result.each do |pharmacy|
       if pharmacy.area.town == town
         interm.push(pharmacy)
       end
    end
    @blood_banks = interm
  end

  def search_for_town(town)
    areas = Area.where(town: town)
    @blood_banks= BloodBank.where(:area_id => areas)
  end
    def blood_bank_params
      params.require(:blood_bank).permit(:name, :area_id, :googlemap_link, :number1, :number2, :town_id)
    end

end
