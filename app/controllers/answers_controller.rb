class AnswersController < ApplicationController
  #before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    if current_user.role_id == Rails.configuration.admin_role
      @formularies = Answer.select("answers.id as answer_id, answers.user_id as user_id, answers.created_at as created_at, answers.user_counter as user_counter, answers.wrapper_id as wrapper_id, users.email as user_email, form_wrappers.id as form_wrapper_id, form_wrappers.title_#{locale} as title").joins(:user, :custom_form => [:section => :form_wrapper]).group(:user_id, :wrapper_id, :user_counter).page(params[:page]).per(Rails.configuration.per_page)
    else
      @formularies = Answer.select("answers.id as answer_id, answers.user_id as user_id, answers.created_at as created_at, answers.user_counter as user_counter, answers.wrapper_id as wrapper_id, users.email as user_email, form_wrappers.id as form_wrapper_id, form_wrappers.title_#{locale} as title").joins(:user, :custom_form => [:section => :form_wrapper]).where(:user_id => current_user.id).group(:user_counter, :wrapper_id).page(params[:page]).per(Rails.configuration.per_page)
    end
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    @form_wrapper = FormWrapper.where(:id => params[:id]).first
    @sections = @form_wrapper.sections.order(:sort_index).includes(:custom_forms).order("custom_forms.sort_index")
    @answers = Answer.where(:user_counter => params[:user_counter], :user_id => params[:user_id])
    unless @answers.first.user_id == current_user.id
      check_user_ability
    end
  end

  # GET /answers/new
  def new
    check_forms = FormWrapper.where(:active => true)
    if check_forms.size > 0
      @answer_form = Answer.new
      @form_wrapper = FormWrapper.where(:active => true).first
      @sections = @form_wrapper.sections.order(:sort_index).includes(:custom_forms).order("custom_forms.sort_index")
    else
      redirect_to new_alert:_path
    end
  end

  # GET /answers/1/edit
  def edit
    @answers = Answer.where(:user_counter => params[:user_counter], :wrapper_id => params[:wrapper_id], :user_id => current_user.id)
    if @answers.first.user_id == current_user.id
      @answer_form = Answer.new
      @form_wrapper = FormWrapper.where(:id => params[:wrapper_id]).first
      @sections = @form_wrapper.sections.order(:sort_index).includes(:custom_forms).order("custom_forms.sort_index")
      @edit = true
      @user_counter = params[:user_counter]
    else
      redirect_to answers_path
    end
  end

  # POST /answers
  # POST /answers.json
  def create
    if params.blank? == false && params[:answer][:editing]
      Answer.update_stored_answers(params, current_user)
      redirect_to answers_path, alert: I18n.t('activerecord.models.answer') + I18n.t('helpers_locale.models.updated')
    else    
      Answer.store_answers(params, current_user)
      redirect_to answers_path, alert: I18n.t('activerecord.models.answer') + I18n.t('helpers_locale.models.created')
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    Answer.store_answers(params, current_user)
    redirect_to answers_path, alert: I18n.t('activerecord.models.answer') + I18n.t('helpers_locale.models.updated')
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, alert: I18n.t('activerecord.models.answer') + I18n.t('helpers_locale.models.deleted') }
      format.json { head :no_content }
    end
  end

  def destroy_responses
    answers = Answer.where(:user_counter => params[:id], :wrapper_id => params[:wrapper_id], :user_id => current_user.id)
    if answers.first.user_id == current_user.id
      answers.destroy_all
      respond_to do |format|
        format.html { redirect_to answers_url, alert: I18n.t('activerecord.models.answer') + I18n.t('helpers_locale.models.deleted') }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:id, :custom_form_id, :user_id, :answer_text, :question_type, :question_text, :language, :wrapper_id)
    end
end
