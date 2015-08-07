json.array!(@artifact_boxes) do |artifact_box|
  json.extract! artifact_box, :id
  json.url artifact_box_url(artifact_box, format: :json)
end
