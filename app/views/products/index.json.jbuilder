json.array!(@products) do |product|
  json.extract! product, :id, :category_id, :title, :description, :price, :picture
  json.url product_url(product, format: :json)
end
