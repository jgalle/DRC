json.array!(@image_materials) do |image_material|
  json.extract! image_material, :id, :ImageMaterial
  json.url image_material_url(image_material, format: :json)
end
