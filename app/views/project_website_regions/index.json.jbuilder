json.array!(@project_website_regions) do |project_website_region|
  json.extract! project_website_region, :id
  json.url project_website_region_url(project_website_region, format: :json)
end
