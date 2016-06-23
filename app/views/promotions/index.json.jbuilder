json.array!(@promotions) do |promotion|
  json.extract! promotion, :id, :id_attachment, :description
  json.url promotion_url(promotion, format: :json)
end
