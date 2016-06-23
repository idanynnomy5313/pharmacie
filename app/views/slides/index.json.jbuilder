json.array!(@slides) do |slide|
  json.extract! slide, :id, :id_attachment, :description
  json.url slide_url(slide, format: :json)
end
