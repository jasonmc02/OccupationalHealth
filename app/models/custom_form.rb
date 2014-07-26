class CustomForm < ActiveRecord::Base

  belongs_to :section
  has_many :answers
  has_many :custom_form_options, :dependent => :destroy

  #after_save :create_fields

  def self.question_types
    [
      {:key => 'input', :val => I18n.t("selects.question_types.input")},
      {:key => 'checkbox', :val => I18n.t("selects.question_types.checkbox")},
      {:key => 'select', :val => I18n.t("selects.question_types.select")},
      {:key => 'date', :val => I18n.t("selects.question_types.date")},
    ]
  end

  def create_fields(checkbox, select, misc, editing)
    def1 = "<div class='row form'><div class='col-sm-12'>"
    def2 = "</div></div>"
    template_en = ""
    template_es = ""
    template_fr = ""
    template_pt = ""
    self.text_en = Sanitize.fragment(self.text_en)
    self.text_es = Sanitize.fragment(self.text_es)
    self.text_fr = Sanitize.fragment(self.text_fr)
    self.text_pt = Sanitize.fragment(self.text_pt)
    if self.field_type.eql?("input")
      if self.required
        template_en += "<label for='custom_form_en_#{self.id}'>#{self.sort_index}) #{self.text_en}</label>"
        template_en += "<div class='box'>"
        template_en += "<input value='' class='form-control spaceless required' id='custom_form_en_#{self.id}' name='answer[responses][#{self.id}]' type='text'>"
        template_en += "</div>"

        template_es += "<label for='custom_form_es_#{self.id}'>#{self.sort_index}) #{self.text_es}</label>"
        template_es += "<div class='box'>"
        template_es += "<input value='' class='form-control spaceless required' id='custom_form_es_#{self.id}' name='answer[responses][#{self.id}]' type='text'>"
        template_es += "</div>"
        
        template_fr += "<label for='custom_form_fr_#{self.id}'>#{self.sort_index}) #{self.text_fr}</label>"
        template_fr += "<div class='box'>"
        template_fr += "<input value='' class='form-control spaceless required' id='custom_form_fr_#{self.id}' name='answer[responses][#{self.id}]' type='text'>"
        template_fr += "</div>"

        template_pt += "<label for='custom_form_pt_#{self.id}'>#{self.sort_index}) #{self.text_pt}</label>"
        template_pt += "<div class='box'>"
        template_pt += "<input value='' class='form-control spaceless required' id='custom_form_pt_#{self.id}' name='answer[responses][#{self.id}]' type='text'>"
        template_pt += "</div>"
      else
        template_en += "<label for='custom_form_en_#{self.id}'>#{self.sort_index}) #{self.text_en}</label>"
        template_en += "<div class='box'>"
        template_en += "<input value='' class='form-control spaceless' id='custom_form_en_#{self.id}' name='answer[responses][#{self.id}]' type='text'>"
        template_en += "</div>"
      
        template_es += "<label for='custom_form_es_#{self.id}'>#{self.sort_index}) #{self.text_es}</label>"
        template_es += "<div class='box'>"
        template_es += "<input value='' class='form-control spaceless' id='custom_form_es_#{self.id}' name='answer[responses][#{self.id}]' type='text'>"
        template_es += "</div>"

        template_fr += "<label for='custom_form_fr_#{self.id}'>#{self.sort_index}) #{self.text_fr}</label>"
        template_fr += "<div class='box'>"
        template_fr += "<input value='' class='form-control spaceless' id='custom_form_fr_#{self.id}' name='answer[responses][#{self.id}]' type='text'>"
        template_fr += "</div>"

        template_pt += "<label for='custom_form_pt_#{self.id}'>#{self.sort_index}) #{self.text_pt}</label>"
        template_pt += "<div class='box'>"
        template_pt += "<input value='' class='form-control spaceless' id='custom_form_pt_#{self.id}' name='answer[responses][#{self.id}]' type='text'>"
        template_pt += "</div>"
      end
    elsif self.field_type.eql?("checkbox")
      unless checkbox[:en].blank?
        def1 = "<div class='row form marginless'><div class='col-sm-12'>"
        template_en += "<label>#{self.sort_index}) #{self.text_en}</label>"
        template_en += "</div></div>"
        template_en += "<div class='row form'><div class='col-sm-12'>"

        template_es += "<label>#{self.sort_index}) #{self.text_es}</label>"
        template_es += "</div></div>"
        template_es += "<div class='row form'><div class='col-sm-12'>"

        template_fr += "<label>#{self.sort_index}) #{self.text_fr}</label>"
        template_fr += "</div></div>"
        template_fr += "<div class='row form'><div class='col-sm-12'>"

        template_pt += "<label>#{self.sort_index}) #{self.text_pt}</label>"
        template_pt += "</div></div>"
        template_pt += "<div class='row form'><div class='col-sm-12'>"

        option_index = 1

        checkbox[:en].each do |option|
          option = Sanitize.fragment(option)
          template_en += "<div class='col-sm-4'>"
          template_en += "<div class='checkbox'>"
          template_en += "<input id='custom_form_en_#{self.id}_#{option_index}' name='answer[responses][#{self.id}][]' type='checkbox' value='#{option}'>"
          template_en += "<label for='custom_form_en_#{self.id}_#{option_index}'>#{option}</label>"
          template_en += "</div>"
          template_en += "</div>"
          option_index += 1
        end
        option_index = 1
        checkbox[:es].each do |option|
          option = Sanitize.fragment(option)
          template_es += "<div class='col-sm-4'>"
          template_es += "<div class='checkbox'>"
          template_es += "<input id='custom_form_es_#{self.id}_#{option_index}' name='answer[responses][#{self.id}][]' type='checkbox' value='#{option}'>"
          template_es += "<label for='custom_form_es_#{self.id}_#{option_index}'>#{option}</label>"
          template_es += "</div>"
          template_es += "</div>"
          option_index += 1
        end
        option_index = 1
        checkbox[:fr].each do |option|
          option = Sanitize.fragment(option)
          template_fr += "<div class='col-sm-4'>"
          template_fr += "<div class='checkbox'>"
          template_fr += "<input id='custom_form_fr_#{self.id}_#{option_index}' name='answer[responses][#{self.id}][]' type='checkbox' value='#{option}'>"
          template_fr += "<label for='custom_form_fr_#{self.id}_#{option_index}'>#{option}</label>"
          template_fr += "</div>"
          template_fr += "</div>"
          option_index += 1
        end
        option_index = 1
        checkbox[:pt].each do |option|
          option = Sanitize.fragment(option)
          template_pt += "<div class='col-sm-4'>"
          template_pt += "<div class='checkbox'>"
          template_pt += "<input id='custom_form_fr_#{self.id}_#{option_index}' name='answer[responses][#{self.id}][]' type='checkbox' value='#{option}'>"
          template_pt += "<label for='custom_form_pt_#{self.id}_#{option_index}'>#{option}</label>"
          template_pt += "</div>"
          template_pt += "</div>"
          option_index += 1
        end
      end
    elsif self.field_type.eql?("select")
      template_en += "<label for='custom_form_en_#{self.id}'>#{self.sort_index}) #{self.text_en}</label>"
      template_en += "<div class='box'>"
      template_en += "<select class='form-control' id='custom_form_en_#{self.id}' name='answer[responses][#{self.id}]'>"
      unless select[:en].blank?
        select[:en].each do |option|
          option = Sanitize.fragment(option)
          template_en += "<option value='#{option}'>#{option}</option>"
        end
      end
      template_en += "</select>"
      template_en += "</div>"

      template_es += "<label for='custom_form_en_#{self.id}'>#{self.sort_index}) #{self.text_es}</label>"
      template_es += "<div class='box'>"
      template_es += "<select class='form-control' id='custom_form_es_#{self.id}' name='answer[responses][#{self.id}]'>"
      unless select[:es].blank?
        select[:es].each do |option|
          option = Sanitize.fragment(option)
          template_es += "<option value='#{option}'>#{option}</option>"
        end
      end
      template_es += "</select>"
      template_es += "</div>"

      template_fr += "<label for='custom_form_en_#{self.id}'>#{self.sort_index}) #{self.text_fr}</label>"
      template_fr += "<div class='box'>"
      template_fr += "<select class='form-control' id='custom_form_fr_#{self.id}' name='answer[responses][#{self.id}]'>"
      unless select[:fr].blank?
        select[:fr].each do |option|
          option = Sanitize.fragment(option)
          template_fr += "<option value='#{option}'>#{option}</option>"
        end
      end
      template_fr += "</select>"
      template_fr += "</div>"

      template_pt += "<label for='custom_form_en_#{self.id}'>#{self.sort_index}) #{self.text_pt}</label>"
      template_pt += "<div class='box'>"
      template_pt += "<select class='form-control' id='custom_form_pt_#{self.id}' name='answer[responses][#{self.id}]'>"
      unless select[:pt].blank?
        select[:pt].each do |option| 
          option = Sanitize.fragment(option)
          template_pt += "<option value='#{option}'>#{option}</option>"
        end
      end
      template_pt += "</select>"
      template_pt += "</div>"
    elsif self.field_type.eql?("date")
      if self.required
        template_en += "<label for='custom_form_en_#{self.id}'>#{self.sort_index}) #{self.text_en}</label>"
        template_en += "<div class='box'>"
        template_en += "<input value='' class='form-control spaceless required datepicker' date='true' id='custom_form_en_#{self.id}' name='answer[responses][#{self.id}]' type='text'>"
        template_en += "</div>"

        template_es += "<label for='custom_form_es_#{self.id}'>#{self.sort_index}) #{self.text_es}</label>"
        template_es += "<div class='box'>"
        template_es += "<input value='' class='form-control spaceless required datepicker' date='true' id='custom_form_es_#{self.id}' name='answer[responses][#{self.id}]' type='text'>"
        template_es += "</div>"
        
        template_fr += "<label for='custom_form_fr_#{self.id}'>#{self.sort_index}) #{self.text_fr}</label>"
        template_fr += "<div class='box'>"
        template_fr += "<input value='' class='form-control spaceless required datepicker' date='true' id='custom_form_fr_#{self.id}' name='answer[responses][#{self.id}]' type='text'>"
        template_fr += "</div>"

        template_pt += "<label for='custom_form_pt_#{self.id}'>#{self.sort_index}) #{self.text_pt}</label>"
        template_pt += "<div class='box'>"
        template_pt += "<input value='' class='form-control spaceless required datepicker' date='true' id='custom_form_pt_#{self.id}' name='answer[responses][#{self.id}]' type='text'>"
        template_pt += "</div>"
      else
        template_en += "<label for='custom_form_en_#{self.id}'>#{self.sort_index}) #{self.text_en}</label>"
        template_en += "<div class='box'>"
        template_en += "<input value='' class='form-control spaceless datepicker' date='true' id='custom_form_en_#{self.id}' name='answer[responses][#{self.id}]' type='text'>"
        template_en += "</div>"
      
        template_es += "<label for='custom_form_es_#{self.id}'>#{self.sort_index}) #{self.text_es}</label>"
        template_es += "<div class='box'>"
        template_es += "<input value='' class='form-control spaceless datepicker' date='true' id='custom_form_es_#{self.id}' name='answer[responses][#{self.id}]' type='text'>"
        template_es += "</div>"

        template_fr += "<label for='custom_form_fr_#{self.id}'>#{self.sort_index}) #{self.text_fr}</label>"
        template_fr += "<div class='box'>"
        template_fr += "<input value='' class='form-control spaceless datepicker' date='true' id='custom_form_fr_#{self.id}' name='answer[responses][#{self.id}]' type='text'>"
        template_fr += "</div>"

        template_pt += "<label for='custom_form_pt_#{self.id}'>#{self.sort_index}) #{self.text_pt}</label>"
        template_pt += "<div class='box'>"
        template_pt += "<input value='' class='form-control spaceless datepicker' date='true' id='custom_form_pt_#{self.id}' name='answer[responses][#{self.id}]' type='text'>"
        template_pt += "</div>"
      end
    end

    self.update_attributes(
      :question_en => def1 + template_en + def2, 
      :question_es => def1 + template_es + def2, 
      :question_fr => def1 + template_fr + def2, 
      :question_pt => def1 + template_pt + def2
    )

    if editing
      answers = self.answers
      answers.each do |answer|
        case answer.language
        when "en"
          answer.update_attribute(:question_text, self.text_en)
        when "es"
          answer.update_attribute(:question_text, self.text_es)
        when "fr"
          answer.update_attribute(:question_text, self.text_fr)
        when "pt"
          answer.update_attribute(:question_text, self.text_pt)
        end
      end
    end 
  end

  def store_options(checkbox, select, misc, editing)
    index = 0
    if editing
      self.custom_form_options.destroy_all
      unless checkbox[:en].blank? && select[:en].blank?
        if checkbox[:en].blank?
          while index < select[:en].length
            obj = CustomFormOption.new()
            
            obj.custom_form_id = self.id
            obj.field_type = self.field_type
            
            obj.description_en = select[:en][index]
            obj.description_es = select[:es][index]
            obj.description_fr = select[:fr][index]
            obj.description_pt = select[:pt][index]

            #obj.misc_en = misc[:en]
            #obj.misc_es = misc[:es]
            #obj.misc_fr = misc[:fr]
            #obj.misc_pt = misc[:pt]

            obj.save
            index += 1
          end
        else
          while index < checkbox[:en].length
            obj = CustomFormOption.new()
            
            obj.custom_form_id = self.id
            obj.field_type = self.field_type
            
            obj.description_en = checkbox[:en][index]
            obj.description_es = checkbox[:es][index]
            obj.description_fr = checkbox[:fr][index]
            obj.description_pt = checkbox[:pt][index]

            #obj.misc_en = misc[:en]
            #obj.misc_es = misc[:es]
            #obj.misc_fr = misc[:fr]
            #obj.misc_pt = misc[:pt]

            obj.save
            index += 1
          end
        end
      end
    else
      unless checkbox[:en].blank? && select[:en].blank?
        if checkbox[:en].blank?
          while index < select[:en].length
            obj = CustomFormOption.new()
            
            obj.custom_form_id = self.id
            obj.field_type = self.field_type
            
            obj.description_en = select[:en][index]
            obj.description_es = select[:es][index]
            obj.description_fr = select[:fr][index]
            obj.description_pt = select[:pt][index]

            #obj.misc_en = misc[:en]
            #obj.misc_es = misc[:es]
            #obj.misc_fr = misc[:fr]
            #obj.misc_pt = misc[:pt]

            obj.save
            index += 1
          end
        else
          while index < checkbox[:en].length
            obj = CustomFormOption.new()
            
            obj.custom_form_id = self.id
            obj.field_type = self.field_type
            
            obj.description_en = checkbox[:en][index]
            obj.description_es = checkbox[:es][index]
            obj.description_fr = checkbox[:fr][index]
            obj.description_pt = checkbox[:pt][index]

            #obj.misc_en = misc[:en]
            #obj.misc_es = misc[:es]
            #obj.misc_fr = misc[:fr]
            #obj.misc_pt = misc[:pt]

            obj.save
            index += 1
          end
        end
      end
    end
  end

  def check_index
    if self.sort_index.blank?
      other_questions = CustomForm.where(:section_id => self.section_id).order(:sort_index).last()
      if other_questions.sort_index.blank?
        label_en = self.question_en.gsub(">) ", ">1) ")
        label_es = self.question_es.gsub(">) ", ">1) ")
        label_fr = self.question_fr.gsub(">) ", ">1) ")
        label_pt = self.question_pt.gsub(">) ", ">1) ")
        self.update_attributes(
          :question_en => label_en,
          :question_es => label_es,
          :question_fr => label_fr,
          :question_pt => label_pt,
          :sort_index => "1"
        )
      else
        next_index = other_questions.sort_index.next
        self.update_attribute(:sort_index, other_questions.sort_index.next)
        label_en = self.question_en.gsub(">) ", ">#{next_index}) ")
        label_es = self.question_es.gsub(">) ", ">#{next_index}) ")
        label_fr = self.question_fr.gsub(">) ", ">#{next_index}) ")
        label_pt = self.question_pt.gsub(">) ", ">#{next_index}) ")
        self.update_attributes(
          :question_en => label_en,
          :question_es => label_es,
          :question_fr => label_fr,
          :question_pt => label_pt,
          :sort_index => next_index
        )
      end
    end
  end
end
