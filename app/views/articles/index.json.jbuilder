json.array!(@articles) do |article|
  json.extract! article, :id, :title, :summary, :thumbnail, :body, :position
  json.url article_url(article, format: :json)
end
