json.array!(@registers) do |register|
  json.extract! register, :id, :firstname, :lastname, :gender, :address, :email
  json.url register_url(register, format: :json)
end
