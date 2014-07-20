class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    if current_user.role_id == Rails.configuration.admin_role
      @formularies = Answer.select("answers.id as answer_id, answers.user_id as user_id, answers.created_at as created_at, answers.user_counter as user_counter, users.email as user_email, form_wrappers.id as form_wrapper_id, form_wrappers.title_#{locale} as title").joins(:user, :custom_form => [:section => :form_wrapper]).group(:user_id, :user_counter).page(params[:page]).per(Rails.configuration.per_page)
    else
      @formularies = Answer.select("answers.id as answer_id, answers.user_id as user_id, answers.created_at as created_at, answers.user_counter as user_counter, users.email as user_email, form_wrappers.id as form_wrapper_id, form_wrappers.title_#{locale} as title").joins(:user, :custom_form => [:section => :form_wrapper]).where(:user_id => current_user.id).group(:user_counter).page(params[:page]).per(Rails.configuration.per_page)
    end
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    @form_wrapper = FormWrapper.where(:active => true).first
    @sections = @form_wrapper.sections.order(:sort_index).includes(:custom_forms).order("custom_forms.sort_index")
    @answers = Answer.where(:user_counter => params[:user_counter], :user_id => params[:user_id])
  end

  # GET /answers/new
  def new
    check_forms = FormWrapper.where(:active => true)
    if check_forms.size > 0
      @answer_form = Answer.new
      @form_wrapper = FormWrapper.where(:active => true).first
      @sections = @form_wrapper.sections.order(:sort_index).includes(:custom_forms).order("custom_forms.sort_index")
    else
      redirect_to new_formulary_path
    end
  end

  # GET /answers/1/edit
  def edit
    @answers = Answer.where(:user_counter => params[:user_counter], :user_id => current_user.id)
    if @answers.first.user_id == current_user.id
      @answer_form = Answer.new
      @form_wrapper = FormWrapper.where(:active => true).first
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
      redirect_to answers_path
    else
      Answer.store_answers(params, current_user)
      redirect_to answers_path
    end
    #respond_to do |format|
    #  if @answer.save
    #    format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
    #    format.json { render action: 'show', status: :created, location: @answer }
    #  else
    #    format.html { render action: 'new' }
    #    format.json { render json: @answer.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    Answer.store_answers(params, current_user)
    redirect_to answers_path
    #respond_to do |format|
    #  if @answer.update(answer_params)
    #    format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
    #    format.json { head :no_content }
    #  else
    #    format.html { render action: 'edit' }
    #    format.json { render json: @answer.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url }
      format.json { head :no_content }
    end
  end

  def destroy_responses
    answers = FormWrapper.where("form_wrappers.id = ? and answers.user_id = ?", params[:id], current_user.id).joins(:sections => [:custom_forms => :answers])
    answers.destroy_all
    respond_to do |format|
      format.html { redirect_to answers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:id, :custom_form_id, :user_id, :answer_text, :question_type, :question_text, :language)
    end
end
