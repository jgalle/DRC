json.array!(@button_shapes) do |button_shape|
  json.extract! button_shape, :id, :ButtonShape
  json.url button_shape_url(button_shape, format: :json)
end
