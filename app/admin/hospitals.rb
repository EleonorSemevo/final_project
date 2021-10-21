ActiveAdmin.register Hospital do

  # form.input :authors, :as => :check_boxes, :collection => Speciality.order("last_name ASC").all
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :area_id, :public, :googlemap_link, :number1, :number2, {specialities: []}
   form do |f|
     f.inputs 'New Hospital' do
     f.inputs
     f.input :specialities, :as => :check_boxes, :collection => Speciality.order("name ASC").all

     # Speciality.each do |speciality|
     #   f.input :speciality, :as => :check_boxes, :collection => Speciality.order("name ASC").all
     # end
    #  Speciality.all. each do |speciality|
    #  check_box_tag ""
    # end
    end




     f.actions
   end

   after_create do |hospital|
    specialities = params[:hospital][:speciality_ids]
    specialities.each do |speciality_id|
      if speciality_id != ""
        HospitalSpeciality.create('hospital_id': hospital.id, 'speciality_id':speciality_id)
      end
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
