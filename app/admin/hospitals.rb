ActiveAdmin.register Hospital do

  # form.input :authors, :as => :check_boxes, :collection => Speciality.order("last_name ASC").all
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #

   permit_params  :name, :area_id, :public, :googlemap_link, :number1, :number2,
    hospital_specialities_attributes: [:speciality_id, timetables_attributes: [:day,
      :start_hour, :end_hour, :_destroy]
    ]


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
      end
   end

  f.actions
   end

   # before_update
   #   specialities = params[:hospital][:hospital_specialities_attributes]
   #   specialities.each do
   #
   #   end
   # end

   controller do
     def before_update
       specialities = params[:hospital][:hospital_specialities_attributes]
       Hospital.find(params[:id]).hospital_specialities.each do |m|
         Timetable.find_by(hospital_speciality_id: m.id).destroy
       end
        Hospital.find(params[:id]).hospital_specialities.destroy_all
    end
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
end
