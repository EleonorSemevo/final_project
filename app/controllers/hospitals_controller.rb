class HospitalsController < ApplicationController
  before_action :set_hospital, only: %i[ show edit update destroy ]

  # GET /hospitals or /hospitals.json
  def index
    @comments = Comment.all
    @comment = Comment.new

    @hospitals = Hospital.all
    if params[:hospital].present?
      name = params[:hospital][:name]
      area_id = params[:hospital][:area_id]
      town_id = params[:hospital][:town_id]
      if town_id !=""
        town = Area.find(town_id.to_i).town
      end
      speciality_id = params[:hospital][:speciality_id]

    if name !='' && area_id !='' && town_id != "" && speciality_id != ""
      search_for_name_town_area_speciality(name,area_id,speciality_id, town)
    elsif name !='' && area_id !='' && town_id != '' && speciality_id == ""
      search_for_name_town_area(name,town,area_id)
    elsif name !='' && area_id !='' && town_id == '' && speciality_id != ''
      search_for_name_area_speciality(name,area_id,speciality_id)
    elsif name !='' && area_id =='' && town_id != '' && speciality_id != ''
      search_for_name_town_speciality(name,town,speciality_id)
    elsif name =='' && area_id !='' && town_id != '' && speciality_id != ''
      search_for_area_town_speciality(town,area_id, speciality_id)
    elsif name !='' && area_id !='' && town_id == '' && speciality_id == ''
      search_for_name_area(name,area_id)
    elsif name !='' && area_id =='' && town_id != '' && speciality_id == ''
      search_for_name_town(name,town)
    elsif name =='' && area_id !='' && town_id != '' && speciality_id == ''
      search_for_area_town(area_id,town)
    elsif name !='' && area_id =='' && town_id == '' && speciality_id != ''
      search_for_name_speciality(name,speciality_id)
    elsif name =='' && area_id !='' && town_id == '' && speciality_id != ''
      search_for_area_speciality(area_id,speciality_id)
    elsif name =='' && area_id =='' && town_id != '' && speciality_id != ''
        search_for_town_speciality(town,speciality_id)
    elsif name !=''
      @hospitals = Hospital.search_name(name)
    elsif area_id !=''
      @hospitals = Hospital.search_area(area_id)
    elsif town_id != ''
      search_town(town)
    elsif speciality_id != ''
      search_speciality(speciality_id)
    end
  end
end



  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hospital
      @hospital = Hospital.find(params[:id])
    end

    def search_for_name_town_area_speciality(name,area_id,speciality_id, town)
      result = Hospital.search_name(name).search_area(area_id)
      interm = []
      speciality = Speciality.find(speciality_id)
      # rechercher selon town et speciality
      result.each do |hospital|
         if hospital.area.town == town and speciality.in? hospital.specialities
           interm.push(hospital)
         end
      end
      @hospitals = interm
    end

    def search_for_name_town_area(name,town,area_id)
      result = Hospital.search_name(name).search_area(area_id)
      interm = []
      # rechercher selon town
      result.each do |hospital|
         if hospital.area.town == town
           interm.push(hospital)
         end
      end
      @hospitals = interm
    end
    def search_for_name_area_speciality(name,area_id,speciality_id)
      result = Hospital.search_name(name).search_area(area_id)
      interm = []
      speciality = Speciality.find(speciality_id)
      # rechercher selon town et speciality
      result.each do |hospital|
         if speciality.in? hospital.specialities
           interm.push(hospital)
         end
      end
      @hospitals = interm
    end

    def search_for_name_town_speciality(name,town,speciality_id)
      result = Hospital.search_name(name)
      interm = []
      speciality = Speciality.find(speciality_id)
      # rechercher selon town et speciality
      result.each do |hospital|
         if hospital.area.town == town and speciality.in? hospital.specialities
           interm.push(hospital)
         end
      end
      @hospitals = interm
    end

    def search_for_area_town_speciality(town,area_id, speciality_id)
      result = Hospital.search_area(area_id)
      interm = []
      speciality = Speciality.find(speciality_id)
      # rechercher selon town et speciality
      result.each do |hospital|
         if hospital.area.town == town and speciality.in? hospital.specialities
           interm.push(hospital)
         end
      end
      @hospitals = interm
    end

    def search_for_name_area(name,area_id)
      @hospitals = Hospital.search_name(name).search_area(area_id)
    end

    def search_for_name_town(name,town)
      result = Hospital.search_name(name)
      interm = []
      # rechercher selon town
      result.each do |hospital|
         if hospital.area.town == town
           interm.push(hospital)
         end
      end
      @hospitals = interm
    end

    def search_for_area_town(area_id,town)
      result = Hospital.search_area(area_id)
      interm = []
      # rechercher selon town
      result.each do |hospital|
         if hospital.area.town == town
           interm.push(hospital)
         end
      end
      @hospitals = interm
    end

    def search_for_name_speciality(name,speciality_id)
      result = Hospital.search_name(name)
      interm = []
      speciality = Speciality.find(speciality_id)
      # rechercher selon town et speciality
      result.each do |hospital|
         if speciality.in? hospital.specialities
           interm.push(hospital)
         end
       end
      @hospitals = interm
    end

    def search_for_area_speciality(area_id,speciality_id)
      result = Hospital.search_area(area_id)
      interm = []
      speciality = Speciality.find(speciality_id)
      # rechercher selon town et speciality
      result.each do |hospital|
         if speciality.in? hospital.specialities
           interm.push(hospital)
         end
       end
      @hospitals = interm
    end

    def search_for_town_speciality(town,speciality_id)
      result = Hospital.all
      interm = []
      speciality = Speciality.find(speciality_id)
      # rechercher selon town et speciality
      result.each do |hospital|
         if  speciality.in? hospital.specialities
           if hospital.area.town == town
             interm.push(hospital)
           end
         end
       end
      @hospitals = interm
    end

    def search_speciality(speciality_id)
      result = Hospital.all
      interm = []
      speciality = Speciality.find(speciality_id)
      # rechercher selon town et speciality
      result.each do |hospital|
        if speciality.in? hospital.specialities
           interm.push(hospital)
         end
       end
      @hospitals = interm
    end

    def search_town(town)
      result = Hospital.all
      interm = []
      result.each do |hospital|
        if hospital.area.town == town
           interm.push(hospital)
         end
       end
      @hospitals = interm
    end

    # Only allow a list of trusted parameters through.
    def hospital_params
      params.require(:hospital).permit(:name, :area_id, :public, :googlemap_link, :number1, :number2,:town_id)
    end
end
