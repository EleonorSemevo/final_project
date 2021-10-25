ActiveAdmin.register Hospital do

  # form.input :authors, :as => :check_boxes, :collection => Speciality.order("last_name ASC").all
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #

   permit_params  :name, :area_id, :public, :googlemap_link, :number1, :number2,
    hospital_specialities_attributes: [:speciality_id, timetables_attributes: [:day,  :start_hour, :end_hour, :_destroy],],
     hospital_insurances_attributes: [:hospital_id, :insurance_id]


 # form :partial => "form"

   form do |f|
     f.semantic_errors *f.object.errors.keys

     f.inputs 'New Hospital' do
     f.inputs

     # f.input :specialities, :as => :check_boxes, :collection => Speciality.order("name ASC").all
     f.inputs do
        f.has_many :hospital_specialities, sortable: :id, sortable_start: 1 do |t|
          t.input :speciality_id, as: 'select', collection: Speciality.all
            t.has_many :timetables, allow_destroy: true do |m|
              m.input :day
              m.input :start_hour
              m.input :end_hour
            end
        end

        f.has_many :hospital_insurances, sortable: :id,  sortable_start: 1 do |c|
          c.input :insurance_id, as: 'select', collection: Insurance.all
        end
      end
   end

  f.actions
   end

   controller do
     def update
       Hospital.find(params[:id]).hospital_specialities.each do |m|
         if Timetable.find_by(hospital_speciality_id: m.id).present?
           Timetable.find_by(hospital_speciality_id: m.id).destroy
         end
       end

        Hospital.find(params[:id]).hospital_specialities.destroy_all
        Hospital.find(params[:id]).hospital_insurances.destroy_all
        update!
    end

    def create

      @hospital = Hospital.create(params.require(:hospital).permit(:name, :area_id, :public, :googlemap_link, :number1, :number2,:town_id))
      hospital_params = params[:hospital][:hospital_specialities_attributes]
      if   params[:hospital][:hospital_specialities_attributes].present?
        params[:hospital][:hospital_specialities_attributes].each do |p|
          @h_p = HospitalSpeciality.create(hospital_id: @hospital.id, speciality_id: p.last[:speciality_id].to_i)
        if p.last[:timetables_attributes].present?
          p.last[:timetables_attributes].each do |m|

          timetable=  Timetable.create(day: m.last[:day] , start_hour: m.last[:start_hour].to_i,
            end_hour: m.last[:end_hour].to_i, hospital_speciality_id: @h_p.id)
            # m.id
          end
        end

      end
      end

      if params[:hospital][:hospital_insurances_attributes].present?
         params[:hospital][:hospital_insurances_attributes].each do |insurance|
           HospitalInsurance.create(hospital_id: @hospital.id, insurance_id: insurance.last[:insurance_id].to_i)
         end
      end
      create!

    end



    def hospital_params
      params.require(:hospital).permit(:name, :area_id, :public, :googlemap_link, :number1, :number2,:town_id)
    end

  #
  # or
  #
#   permit_params do
#     # permitted = [:name, :area_id, :public, :googlemap_link, :number1, :number2]
#     permitted = [
#       :name, :area_id, :public, :googlemap_link, :number1, :number2,
#        hospital_specialities_attributes: [:speciality_id, timetables_attributes: [:day,
#          :start_hour, :end_hour, :_destroy]
#        ]
#     ]
#     # permitted << :other if params[:action] == 'create' && current_user.admin?
#     permitted << :other if params[:action] == 'create' && current_user.admin?
#     permitted
#   # end
#
# def hospital_params
#   params.require(:hospital).permit(:name, :area_id, :public, :googlemap_link, :number1, :number2,:town_id,)
# end
    end

    # def before_update
    #
    # end

end
