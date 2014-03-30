json.array!(@formularies) do |formulary|
  json.extract! formulary, :id, :user_id
  json.url formulary_url(formulary, format: :json)
end
