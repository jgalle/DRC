json.array!(@website_regions) do |website_region|
  json.extract! website_region, :id, :WebsiteRegion
  json.url website_region_url(website_region, format: :json)
end
