class HospitalsController < ApplicationController
  before_action :set_hospital, only: %i[ show edit update destroy ]

  # GET /hospitals or /hospitals.json
  def index
    @hospitals = Hospital.all
    # if params[:search].present?
    #   name = params[:hospital][:name]
    #   area_id = params[:hospital][:area_id].to_i
    #   town_id = params[:hospital][:town_id].to_i
    #   if town_id!=''
    #     town = Area.find(town_id)
    #   end
    #   specality_id = params[:hospital][:specality_id].to_i
    #   if name !='' && area_id !='' && town_id != '' && speciality_id != ''
    #   result =  Hospital.where('name like ? and area_id like ?')
    #   # recherche de town
    #   hosp_town = []
    #   result.each do |hospital|
    #     if hospital.area.town == town_id
    #       hosp_town.push(hospital)
    #     end
    #   end
    #   # fin recherche de town
    #   specialities  = Hospital
    #   @hospitals.each do |hospital|
    #     if hospital.specialities
    #     end
    #   end
    #
    #   end

    # end
  end

  # GET /hospitals/1 or /hospitals/1.json
  def show
  end

  # GET /hospitals/new
  def new
    @hospital = Hospital.new
  end

  # GET /hospitals/1/edit
  def edit
  end

  # POST /hospitals or /hospitals.json
  def create
    @hospital = Hospital.new(hospital_params)

    respond_to do |format|
      if @hospital.save
        format.html { redirect_to @hospital, notice: "Hospital was successfully created." }
        format.json { render :show, status: :created, location: @hospital }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hospital.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hospitals/1 or /hospitals/1.json
  def update
    respond_to do |format|
      if @hospital.update(hospital_params)
        format.html { redirect_to @hospital, notice: "Hospital was successfully updated." }
        format.json { render :show, status: :ok, location: @hospital }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hospital.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hospitals/1 or /hospitals/1.json
  def destroy
    @hospital.destroy
    respond_to do |format|
      format.html { redirect_to hospitals_url, notice: "Hospital was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hospital
      @hospital = Hospital.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hospital_params
      params.require(:hospital).permit(:name, :area_id, :public, :googlemap_link, :number1, :number2,:search,:town_id,:speciality_id)
    end
end
