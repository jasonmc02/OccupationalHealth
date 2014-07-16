json.array!(@form_wrappers) do |form_wrapper|
  json.extract! form_wrapper, :id, :title_en, :title_es, :title_fr, :title_pt, :description_en, :description_es, :description_fr, :description_pt, :active
  json.url form_wrapper_url(form_wrapper, format: :json)
end
