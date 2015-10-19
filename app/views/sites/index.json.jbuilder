json.array!(@sites) do |site|
  json.extract! site, :id, :name, :location, :company_id
  json.url site_url(site, format: :json)
end
