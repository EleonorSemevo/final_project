ActiveAdmin.register Pharmacy do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :area_id, :all_nigth, :googlemap_link, :number1, :number2,
  pharmacy_insurances_attributes: [:pharmacy_id, :insurance_id]
  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs 'New Pharmacy' do
    f.inputs

    # f.input :insurances, :as => :check_boxes, :collection => Insurance.order("name ASC").all
    f.inputs do
       f.has_many :pharmacy_insurances, allow_destroy: true, sortable: :id, sortable_start: 1 do |t|
         t.input :insurance_id, as: 'select', collection: Insurance.all
       end
     end
  end

 f.actions
  end

  controller do
    def update
       Pharmacy.find(params[:id]).pharmacy_insurances.destroy_all
       update!
    end
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :area_id, :all_nigth, :googlemap_link, :number1, :number2]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
