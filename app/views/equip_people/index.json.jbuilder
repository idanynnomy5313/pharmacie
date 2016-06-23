json.array!(@equip_people) do |equip_person|
  json.extract! equip_person, :id, :name, :id_attachment, :description
  json.url equip_person_url(equip_person, format: :json)
end
