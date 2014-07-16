json.array!(@answers) do |answer|
  json.extract! answer, :id, :custom_form_id, :answer_text, :question_type
  json.url answer_url(answer, format: :json)
end
