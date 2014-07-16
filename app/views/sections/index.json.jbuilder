json.array!(@sections) do |section|
  json.extract! section, :id, :form_wrapper_id, :title_en, :title_es, :title_fr, :title_pt, :description_en, :description_es, :description_fr, :description_pt, :sort_index
  json.url section_url(section, format: :json)
end
