ActiveAdmin.register Product do
  menu :priority => 2
  permit_params :title, :description,:price, :picture, :category_id

   form :html => { :enctype => "multipart/form-data" } do |f|
     f.inputs do
      f.input :category
      f.input :title
      f.input :description
      f.input :price
      f.input :picture, :as => :file, :hint => image_tag(f.product.picture.url(:thumb))
    end
    f.actions
   end

  scope :all, :default => true


  index :as => :grid do |product|
    div do
      a :href => admin_product_path(product) do
        image_tag(product.picture.url(:thumb))
      end
    end
    a truncate(product.title), :href => admin_product_path(product)
  end

  show :title => :title
  show do |product|
    attributes_table do
      row :id
      row :title
      row :description
      row :price
      row :created_at
      row :picture do
        product.picture? ? image_tag(product.picture.url(:medium)) : content_tag(:span, "No picture yet")
      end
    end
    active_admin_comments
  end

  sidebar :product_stats, :only => :show do
    attributes_table_for resource do
      row("Total Sold")  { product.line_items.where.not(order_id: nil).sum(:quantity) }
      row("Dollar Value"){ number_to_currency product.line_items.where.not(order_id: nil).sum(:price) }
    end
  end

  sidebar :recent_orders, :only => :show do
    product.orders.limit(5).collect do |order|
      auto_link(order)
    end.join(content_tag("br")).html_safe
  end

end