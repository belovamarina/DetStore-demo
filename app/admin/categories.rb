ActiveAdmin.register Category do
permit_params :title, :description, :picture

  form :html => { :enctype => "multipart/form-data" } do |f|
     f.inputs do
      f.input :title
      f.input :description
      f.input :picture, :as => :file, :hint => image_tag(f.category.picture.url(:thumb))
    end
    f.actions
  end

  # Create sections on the index screen
  scope :all, default: true
  # scope :available
  # scope :drafts

  # Filterable attributes on the index screen
  filter :title
  #filter :product, as: :select, collection: ->{ Category.products }
  filter :created_at

  # Customize columns displayed on the index screen in the table
  index do
    column :title
    actions
  end

  show :title => :title
  show do |category|
    attributes_table do
      row :id
      row :title
      row :description
      row :created_at
      row :picture do
        category.picture? ? image_tag(category.picture.url(:medium)) : content_tag(:span, "No picture yet")
      end
    end
    active_admin_comments
  end

end

