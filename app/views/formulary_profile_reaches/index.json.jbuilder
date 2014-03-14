json.array!(@formulary_profile_reaches) do |formulary_profile_reach|
  json.extract! formulary_profile_reach, :id, :research, :action, :policy
  json.url formulary_profile_reach_url(formulary_profile_reach, format: :json)
end
