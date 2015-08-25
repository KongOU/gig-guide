json.array!(@musicians) do |musician|
  json.extract! musician, :id, :name, :description, :genre, :origin
  json.url musician_url(musician, format: :json)
end
