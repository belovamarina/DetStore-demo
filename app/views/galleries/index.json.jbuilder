json.array!(@galleries) do |gallery|
  json.extract! gallery, :id, :name, :description, :product_id, :category_id
  json.url gallery_url(gallery, format: :json)
end
