ActiveAdmin.register Video do

  action_item :view do
    link_to 'Sync!', sync_path
  end

  permit_params Video.attribute_names.map(&:to_sym)
end
