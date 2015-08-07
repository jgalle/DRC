json.array!(@image_forms) do |image_form|
  json.extract! image_form, :id, :ImageForm
  json.url image_form_url(image_form, format: :json)
end
