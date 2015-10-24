ActiveAdmin.register Path do
  permit_params Path.attribute_names.map(&:to_sym)
end
