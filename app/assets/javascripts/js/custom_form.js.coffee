CustomForm = 
  options_index: 0
  form: null
  choices_template: null

CustomForm.initialize = ->
  CustomForm.form = $("form")
  CustomForm.field_type_element = CustomForm.form.find("#custom_form_field_type")
  CustomForm.select_options_container = CustomForm.form.find(".select_options_container")
  CustomForm.checkbox_options_container = CustomForm.form.find(".checkbox_options_container")
  checkbox = CustomForm.checkbox_options_container.find(".form-group").length
  select = CustomForm.select_options_container.find(".form-group").length
  if checkbox > 0
    CustomForm.options_index = checkbox
  else if select > 0
    CustomForm.options_index = select

CustomForm.rename_all = () ->
  labels = CustomForm.form.find(".field_type_options").find("label")
  labels.map (index, label) ->
    CustomForm.options_index++
    label = $(label)
    text = label.text()
    text = text.substring(0, text.indexOf(" ")).concat(" " + CustomForm.options_index)
    label.text(text)

CustomForm.remove_option = (element) ->
  CustomForm.options_index = 0
  element.closest(".form-group").remove()
  CustomForm.rename_all()

CustomForm.clear_all_added_options = () ->
  CustomForm.form.find(".field_type_options").addClass("hide")
  CustomForm.options_index = 0
  CustomForm.select_options_container.html("")
  CustomForm.checkbox_options_container.html("")

CustomForm.add_select_option_choices = () ->
  CustomForm.form.find(".field_type_options").removeClass("hide")
  CustomForm.select_options_container.append($(".select-options-template").children().clone())
  CustomForm.options_index++
  CustomForm.select_options_container.children(":last").find("input:eq(0)").attr("name", "custom_form[select_field_option_choices_en][]")
  CustomForm.select_options_container.children(":last").find("input:eq(1)").attr("name", "custom_form[select_field_option_choices_es][]")
  CustomForm.select_options_container.children(":last").find("input:eq(2)").attr("name", "custom_form[select_field_option_choices_fr][]")
  CustomForm.select_options_container.children(":last").find("input:eq(3)").attr("name", "custom_form[select_field_option_choices_pt][]")
  if CustomForm.options_index > 1
    label = CustomForm.select_options_container.children(":last").find("label")
    text = label.text()
    text = text.substring(0, text.indexOf(" ")).concat(" " + CustomForm.options_index)
    label.text(text)

CustomForm.add_checkbox_misc_choices = () ->
  CustomForm.checkbox_options_container.append($(".checkbox-misc-template").children().clone())
  CustomForm.checkbox_options_container.find("input:eq(0)").attr("name", "custom_form[checkbox_field_misc_en]")
  CustomForm.checkbox_options_container.find("input:eq(1)").attr("name", "custom_form[checkbox_field_misc_es]")
  CustomForm.checkbox_options_container.find("input:eq(2)").attr("name", "custom_form[checkbox_field_misc_fr]")
  CustomForm.checkbox_options_container.find("input:eq(3)").attr("name", "custom_form[checkbox_field_misc_pt]")

CustomForm.add_checkbox_option_choices = () ->
  CustomForm.form.find(".field_type_options").removeClass("hide")
  CustomForm.checkbox_options_container.append($(".checkbox-options-template").children().clone())
  CustomForm.options_index++
  CustomForm.checkbox_options_container.children(":last").find("input:eq(0)").attr("name", "custom_form[checkbox_field_option_choices_en][]")
  CustomForm.checkbox_options_container.children(":last").find("input:eq(1)").attr("name", "custom_form[checkbox_field_option_choices_es][]")
  CustomForm.checkbox_options_container.children(":last").find("input:eq(2)").attr("name", "custom_form[checkbox_field_option_choices_fr][]")
  CustomForm.checkbox_options_container.children(":last").find("input:eq(3)").attr("name", "custom_form[checkbox_field_option_choices_pt][]")
  if CustomForm.options_index > 1
    label = CustomForm.checkbox_options_container.children(":last").find("label")
    text = label.text()
    text = text.substring(0, text.indexOf(" ")).concat(" " + CustomForm.options_index)
    label.text(text)

$(document).ready ->
  CustomForm.initialize()
  CustomForm.form.on "click", ".save-continue", (w) ->
    w.preventDefault()
    CustomForm.form.find("#custom_form_save_continue").val("true")
    CustomForm.form.submit()
  CustomForm.form.on "change", "#custom_form_field_type", (w) ->
    w.preventDefault()
    CustomForm.clear_all_added_options()
    if CustomForm.field_type_element.val() == "select"
      CustomForm.add_select_option_choices()
    else if CustomForm.field_type_element.val() == "checkbox"
      CustomForm.add_checkbox_option_choices()
  CustomForm.form.on "click", ".add-more-fields", (w) ->
    w.preventDefault()
    if CustomForm.field_type_element.val() == "select"
      CustomForm.add_select_option_choices()
    else if CustomForm.field_type_element.val() == "checkbox"
      CustomForm.add_checkbox_option_choices()
  CustomForm.form.on "click", ".remove-option", (w) ->
    w.preventDefault()
    CustomForm.remove_option($(w.currentTarget))
