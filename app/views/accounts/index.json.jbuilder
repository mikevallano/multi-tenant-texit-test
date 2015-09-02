json.array!(@accounts) do |account|
  json.extract! account, :id, :subdomain, :name
  json.url account_url(account, format: :json)
end
