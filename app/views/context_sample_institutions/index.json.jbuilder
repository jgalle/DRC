json.array!(@context_sample_institutions) do |context_sample_institution|
  json.extract! context_sample_institution, :id
  json.url context_sample_institution_url(context_sample_institution, format: :json)
end
