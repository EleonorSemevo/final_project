ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :email, :admin, :password_digest, :password, :password_confirmation

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs 'New User' do
      f.input :name
      f.input :email
      f.input :admin
      f.input :password
      f.input :password_confirmation
     end
      f.actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :admin, :password_digest]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
