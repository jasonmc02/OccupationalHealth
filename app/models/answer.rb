class Answer < ActiveRecord::Base

  belongs_to :custom_form
  belongs_to :user

  validate :validate_answer

  def self.store_answers(params, user)
    language = params[:answer][:language]
    responses = params[:answer][:responses]
    unless responses.blank?
      responses.map do |key, val|
        unless key.blank?
          answer = Answer.new()
          question = CustomForm.find(key)

          answer.custom_form_id = key
          answer.user_id = user.id
          answer.question_text = question["text_#{language}"]
          answer.language = language
          answer.user_counter = update_counter(key, user.id)

          case question[:field_type]
          when "input"
            answer.answer_text = val
            answer.question_type = "input"
          when "checkbox"
            answer.answer_text = val.join(", ")
            answer.question_type = "checkbox"
          when "select"
            answer.answer_text = val
            answer.question_type = "select"
          when "date"
            answer.answer_text = val
            answer.question_type = "date"
          end
          answer.save()
        end
      end
    end
  end

  def self.update_stored_answers(params, user)
    language = params[:answer][:language]
    responses = params[:answer][:responses]
    user_counter = params[:answer][:user_counter]
    unless responses.blank?
      responses.map do |key, val|
        unless key.blank?
          answer = Answer.where(:user_id => user.id, :custom_form_id => key, :user_counter => user_counter).first
          case answer.question_type
          when "input"
            answer.update_attribute(:answer_text, val)
          when "checkbox"
            answer.update_attribute(:answer_text, val.join(", "))
          when "select"
            answer.update_attribute(:answer_text, val)
          end
        end
      end
    end
  end

  private
  def validate_answer
    if self.custom_form.required
      if self.answer_text.blank?
        errors.add(:answer_text, "required")
      end
    end
  end

  def self.update_counter(custom_form_id, user_id)
    lastest = Answer.where(:custom_form_id => custom_form_id, :user_id => user_id)
    next_index = 1
    unless lastest.blank?
      if lastest.size > 0
        next_index = lastest.last().user_counter.next
      end
    end
    next_index
  end
end