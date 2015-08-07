json.array!(@context_sample_statuses) do |context_sample_status|
  json.extract! context_sample_status, :id
  json.url context_sample_status_url(context_sample_status, format: :json)
end
