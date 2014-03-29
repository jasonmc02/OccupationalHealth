json.array!(@formulary_context_descriptions) do |formulary_context_description|
  json.extract! formulary_context_description, :id, :formulary_context_id, :project_term, :require_integration, :require_integration_name, :gender, :equity, :community_participation, :policy, :complexity, :other
  json.url formulary_context_description_url(formulary_context_description, format: :json)
end
