json.array!(@formulary_profiles) do |formulary_profile|
  json.extract! formulary_profile, :id, :name, :period, :region, :institution, :description, :objective, :discipline, :success
  json.url formulary_profile_url(formulary_profile, format: :json)
end
