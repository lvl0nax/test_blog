ActiveAdmin.register Article do
  permit_params :title, :body

  form do |f|
    f.semantic_errors
    inputs 'Title' do
      input :title, label: false
    end

    inputs 'Body' do
      input :body, as: :ckeditor, label: false
    end
    actions
  end

  show do |article|
    div do
      article.body.html_safe
    end
  end

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
