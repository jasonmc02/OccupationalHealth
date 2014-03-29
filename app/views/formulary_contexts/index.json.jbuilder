json.array!(@formulary_contexts) do |formulary_context|
  json.extract! formulary_context, :id, :scale_description, :intersectoral_aspect, :intersectoral_aspect_name, :political_jurisdiction, :political_jurisdictions_name, :sociopolitical_context, :local_context, :local_context_name, :project_affect, :project_affect_name, :role_consideration, :role_consideration_name, :key_actors, :success_consideration, :success_considerantion_name
  json.url formulary_context_url(formulary_context, format: :json)
end
