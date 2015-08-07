json.array!(@context_sample_locations) do |context_sample_location|
  json.extract! context_sample_location, :id
  json.url context_sample_location_url(context_sample_location, format: :json)
end
