ActiveAdmin.register Post do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :Title, :User, :Content, :Is_Notice
actions :all

form do |f|
    inputs 'Post' do
      f.input :Title
      f.input :User
      f.input :Content
      f.input :Is_Notice
    end
    f.semantic_errors
    f.actions
  end
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
