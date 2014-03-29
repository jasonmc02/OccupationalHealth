json.array!(@formulary_context_ecosystem_features) do |formulary_context_ecosystem_feature|
  json.extract! formulary_context_ecosystem_feature, :id, :formulary_context_id, :urban, :semiurban, :rural, :wilderness, :disrupted, :resource_extraction, :environmental_degradation, :climate_effect, :natural_force, :coastal, :agricultural, :forest, :rainfores, :cloud_forest, :dry_forest, :old_growth_forest, :mixed_forest, :other, :watershed, :watersheed_name, :wetland, :desert
  json.url formulary_context_ecosystem_feature_url(formulary_context_ecosystem_feature, format: :json)
end
