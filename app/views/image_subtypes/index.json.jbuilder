json.array!(@image_subtypes) do |image_subtype|
  json.extract! image_subtype, :id, :ImageSubtype
  json.url image_subtype_url(image_subtype, format: :json)
end
