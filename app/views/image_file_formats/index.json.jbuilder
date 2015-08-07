json.array!(@image_file_formats) do |image_file_format|
  json.extract! image_file_format, :id, :ImageFileFormat
  json.url image_file_format_url(image_file_format, format: :json)
end
