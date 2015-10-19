json.array!(@buildings) do |building|
  json.extract! building, :id, :name, :street, :city, :state, :zip, :site_id
  json.url building_url(building, format: :json)
end
