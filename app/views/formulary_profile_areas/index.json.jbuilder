json.array!(@formulary_profile_areas) do |formulary_profile_area|
  json.extract! formulary_profile_area, :id, :mining, :pesticide, :occupational_health, :community_paticipation, :watershed_management, :solid_waste_management, :public_health, :animal_health, :determinant_of_health, :food_sovereignty, :indigenous_health, :climate_change, :forest_management, :other
  json.url formulary_profile_area_url(formulary_profile_area, format: :json)
end
