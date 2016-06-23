json.array!(@workers) do |worker|
  json.extract! worker, :id, :name, :description, :address, :tel
  json.url worker_url(worker, format: :json)
end
