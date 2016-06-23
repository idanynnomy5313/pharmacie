json.array!(@equipment) do |equipment|
  json.extract! equipment, :id, :id_attachment, :description
  json.url equipment_url(equipment, format: :json)
end
