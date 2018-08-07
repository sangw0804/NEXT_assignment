ActiveAdmin.register Comment do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
permit_params :content, :post
actions :all

form do |f|
  inputs 'Comment' do
    f.input :content
    f.input :post
  end
  f.semantic_errors
  f.actions
end

end
