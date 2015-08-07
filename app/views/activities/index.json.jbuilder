json.array!(@activities) do |activity|
  json.extract! activity, :id, :user_id, :controller, :action, :id, :activity
  json.url activity_url(activity, format: :json)
end
