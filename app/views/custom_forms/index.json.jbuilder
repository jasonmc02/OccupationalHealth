json.array!(@custom_forms) do |custom_form|
  json.extract! custom_form, :id, :section_id, :type, :en, :es, :fr, :pt, :required
  json.url custom_form_url(custom_form, format: :json)
end
