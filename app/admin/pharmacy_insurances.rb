ActiveAdmin.register PharmacyInsurance do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :pharmacy_id, :insurance_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:pharmacy_id, :insurance_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
