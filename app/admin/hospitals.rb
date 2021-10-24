ActiveAdmin.register Hospital do

  # form.input :authors, :as => :check_boxes, :collection => Speciality.order("last_name ASC").all
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :area_id, :public, :googlemap_link,
    :number1, :number2, {specialities: [],}, :start_hour,
    timetables_attributes: [:id, :hospital_id, :day,
    :start_hour, :end_hour, :_destroy]


 # form :partial => "form"

   form do |f|

     f.inputs 'New Hospital' do
     f.inputs

     # f.input :specialities, :as => :check_boxes, :collection => Speciality.order("name ASC").all
     f.inputs do
        f.has_many :timetables, sortable: :id, sortable_start: 1 do |t|
          t.input :day
          t.input :start_hour
          t.input :end_hour
          t.input :id, as: 'select', collection: Speciality.all
        end
      end

   end




     f.actions
   end

   after_create do |hospital|
    # specialities = params[:hospital][:speciality_ids]
    # specialities.each do |speciality_id|
    #   if speciality_id != ""
    #     HospitalSpeciality.create('hospital_id': hospital.id, 'speciality_id':speciality_id)
    #   end
    # end
    timetables_params = params[:hospital][:timetables_attributes]
    params[:hospital][:timetables_attributes].each do |timetable_param|
      hospital_speciality = HospitalSpeciality.create('hospital_id': hospital.id, 'speciality_id': timetable_param[:id].to_i)
      Timetable.create('hospital_speciality_id': hospital_speciality.id, 'start_hour': timetable_param['start_hour'],
        'end_hour': timetable_param[:end_hour], 'day': timetable_param[:day])
    end
   end

  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :area_id, :public, :googlemap_link, :number1, :number2]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
