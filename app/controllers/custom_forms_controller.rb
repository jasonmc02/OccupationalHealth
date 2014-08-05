class CustomFormsController < ApplicationController
  before_action :check_user_ability
  before_action :set_custom_form, only: [:show, :edit, :update, :destroy]

  # GET /custom_forms
  # GET /custom_forms.json
  def index
    @custom_forms = CustomForm.all
  end

  # GET /custom_forms/1
  # GET /custom_forms/1.json
  def show
  end

  # GET /custom_forms/new
  def new
    if params.has_key?(:form_wrapper_id)
      @sections = Section.where(:form_wrapper_id => params[:form_wrapper_id])
      @question_types = CustomForm.question_types
      @custom_form = CustomForm.new
      @form_wrapper_id = params[:form_wrapper_id]
    else
      redirect_to form_wrappers_path
    end
  end

  # GET /custom_forms/1/edit
  def edit
    section = Section.find(@custom_form.section_id)
    @question_types = CustomForm.question_types
    @sections = Section.where(:form_wrapper_id => section.form_wrapper_id)
    @form_wrapper_id = section.form_wrapper_id
    @options = @custom_form.custom_form_options
  end

  # POST /custom_forms
  # POST /custom_forms.json
  def create
    action = params[:custom_form][:save_continue] || "false"
    form_wrapper_id = params[:custom_form][:form_wrapper_id] || nil
    options_select = {
     :en => params[:custom_form][:select_field_option_choices_en],
     :es => params[:custom_form][:select_field_option_choices_es],
     :fr => params[:custom_form][:select_field_option_choices_fr],
     :pt => params[:custom_form][:select_field_option_choices_pt],
   } || nil
    options_checkbox = {
     :en => params[:custom_form][:checkbox_field_option_choices_en],
     :es => params[:custom_form][:checkbox_field_option_choices_es],
     :fr => params[:custom_form][:checkbox_field_option_choices_fr],
     :pt => params[:custom_form][:checkbox_field_option_choices_pt],
   } || nil
=begin
    misc = {
      :en => params[:custom_form][:checkbox_field_misc_en],
      :es => params[:custom_form][:checkbox_field_misc_es],
      :fr => params[:custom_form][:checkbox_field_misc_fr],
      :pt => params[:custom_form][:checkbox_field_misc_pt]
    } || nil
=end
    @custom_form = CustomForm.new(custom_form_params)

    respond_to do |format|
      if @custom_form.save

        @custom_form.create_fields(options_checkbox, options_select, nil, false)
        @custom_form.store_options(options_checkbox, options_select, nil, false)
        @custom_form.check_index()
        
        if action.eql?("true")
          format.html { redirect_to new_custom_form_path(:form_wrapper_id => form_wrapper_id), alert: I18n.t('activerecord.models.custom_form.single') + I18n.t('helpers_locale.models.created') }
          format.json { render action: 'show', status: :created, location: @custom_form }
        else
          format.html { redirect_to form_wrappers_path, alert: I18n.t('activerecord.models.custom_form.single') + I18n.t('helpers_locale.models.created') }
          format.json { render action: 'show', status: :created, location: @custom_form }
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @custom_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /custom_forms/1
  # PATCH/PUT /custom_forms/1.json
  def update
    form_wrapper_id = params[:custom_form][:form_wrapper_id] || nil
    options_select = {
     :en => params[:custom_form][:select_field_option_choices_en],
     :es => params[:custom_form][:select_field_option_choices_es],
     :fr => params[:custom_form][:select_field_option_choices_fr],
     :pt => params[:custom_form][:select_field_option_choices_pt],
   } || nil
    options_checkbox = {
     :en => params[:custom_form][:checkbox_field_option_choices_en],
     :es => params[:custom_form][:checkbox_field_option_choices_es],
     :fr => params[:custom_form][:checkbox_field_option_choices_fr],
     :pt => params[:custom_form][:checkbox_field_option_choices_pt],
   } || nil
=begin
    misc = {
      :en => params[:custom_form][:checkbox_field_misc_en],
      :es => params[:custom_form][:checkbox_field_misc_es],
      :fr => params[:custom_form][:checkbox_field_misc_fr],
      :pt => params[:custom_form][:checkbox_field_misc_pt]
    } || nil
=end
    respond_to do |format|
      if @custom_form.update(custom_form_params)
        
        @custom_form.create_fields(options_checkbox, options_select, nil, true)
        @custom_form.store_options(options_checkbox, options_select, nil, true)
        @custom_form.check_index()

        format.html { redirect_to questions_custom_form_path(form_wrapper_id), alert: I18n.t('activerecord.models.custom_form.single') + I18n.t('helpers_locale.models.updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @custom_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custom_forms/1
  # DELETE /custom_forms/1.json
  def destroy
    @custom_form.destroy
    respond_to do |format|
      form_wrapper = FormWrapper.find(@custom_form.section.form_wrapper_id)
      format.html { redirect_to questions_custom_form_path(form_wrapper.id), alert: I18n.t('activerecord.models.custom_form.single') + I18n.t('helpers_locale.models.deleted') }
      format.json { head :no_content }
    end
  end

  def questions
    @form_wrapper = FormWrapper.find(params[:id])
    @sections = @form_wrapper.sections.order(:sort_index).includes(:custom_forms).order("custom_forms.sort_index").page(params[:page]).per(Rails.configuration.per_page)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom_form
      @custom_form = CustomForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def custom_form_params
      params.require(:custom_form).permit(:id, :section_id, :field_type, :text_en, :text_es, :text_fr, :text_pt, :required, :question_en, :question_es, :question_fr, :question_pt, :sort_index)
    end
end
