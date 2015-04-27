json.array!(@listings) do |listing|
  json.extract! listing, :id, :heading, :body, :price, :external_url, :timestamp
  json.url listing_url(listing, format: :json)
end
