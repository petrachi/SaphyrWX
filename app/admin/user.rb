ActiveAdmin.register User do
  permit_params User.attribute_names.map(&:to_sym)
end
