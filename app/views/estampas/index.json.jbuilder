json.array!(@estampas) do |estampa|
  json.extract! estampa, :id, :title, :description, :criador, :rating
  json.url estampa_url(estampa, format: :json)
end
