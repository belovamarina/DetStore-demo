ActiveAdmin.register Order do
  menu :priority => 3
  actions :index, :show

  # filter :total_price
  # filter :checked_out_at

  scope :all, :default => true
  # scope :in_progress
  # scope :complete

  index do
    column("Order", :sortable => :id) {|order| link_to "##{order.id} ", admin_order_path(order) }
    # column("State")                   {|order| status_tag(order.state) }
    column("Date", :created_at)
    column("Register Customer", :user, :sortable => :user_id)
    column("Guest name&phone") {|order| "#{order.name} #{order.phone}" }
    column("Total")            {|order| number_to_currency order.order_total_price }
  end

  show do
    panel "Invoice" do
      table_for(order.line_items) do |t|
        t.column("Product") {|item| auto_link item.product        }
        t.column("Price")   {|item| number_to_currency item.price }
        t.column("Quantity")   {|item| item.quantity }
        t.column("Subtotal")   {|item| number_to_currency item.total_price }
        tr :class => "odd" do
          td "Total:", :style => "text-align: right;"
        td number_to_currency order.order_total_price
        end
      end
    end
  end

  sidebar :register_customer_information, :only => :show do
    attributes_table_for order.user do
      row("User") { auto_link order.user }
      row :email
    end
  end

  sidebar :guest_information, :only => :show do
  attributes_table_for order do
      row :name
      row :email
      row :phone
      row :address
    end
  end

end