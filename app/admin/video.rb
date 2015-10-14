ActiveAdmin.register Video do

  action_item :view do
    link_to 'Sync!', sync_path
  end

  permit_params Video.attribute_names.map(&:to_sym)

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
