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

  index do
    selectable_column
    column :title
    column :body do |article|
      truncate strip_tags(article.body).html_safe, length: 290
    end
    actions
  end

end
