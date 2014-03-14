json.array!(@formulary_profile_classifies) do |formulary_profile_classify|
  json.extract! formulary_profile_classify, :id, :project, :part_program, :entire_program, :other, :which
  json.url formulary_profile_classify_url(formulary_profile_classify, format: :json)
end
