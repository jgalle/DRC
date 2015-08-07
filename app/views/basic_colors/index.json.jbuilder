json.array!(@basic_colors) do |basic_color|
  json.extract! basic_color, :id
  json.url basic_color_url(basic_color, format: :json)
end
