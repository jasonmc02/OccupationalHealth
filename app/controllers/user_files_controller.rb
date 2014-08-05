class UserFilesController < ApplicationController
  before_action :check_user_ability
  before_action :set_user_file, only: [:show, :edit, :update, :destroy, :download]

  # GET /user_files
  # GET /user_files.json
  def index
    @currentStep = params[:step] || 1
    @user_file = UserFile.new
    if params[:step].blank?
      @my_files = UserFile.where(:user_id => current_user.id).page(params[:page]).per(Rails.configuration.per_page)
      @shared_with_me = UserFile.joins(:user_file_shares).where("user_file_shares.user_id = ?", current_user.id).page(params[:page]).per(Rails.configuration.per_page)
    elsif params[:step].to_s.eql?("1")
      @my_files = UserFile.where(:user_id => current_user.id).page(params[:page]).per(Rails.configuration.per_page)
      @shared_with_me = UserFile.joins(:user_file_shares).where("user_file_shares.user_id = ?", current_user.id).page(0).per(Rails.configuration.per_page)
    else
      @my_files = UserFile.where(:user_id => current_user.id).page(0).per(Rails.configuration.per_page)
      @shared_with_me = UserFile.joins(:user_file_shares).where("user_file_shares.user_id = ?", current_user.id).page(params[:page]).per(Rails.configuration.per_page)
    end
  end

  # GET /user_files/1
  # GET /user_files/1.json
  def show
  end

  # GET /user_files/new
  def new
    @user_file = UserFile.new
  end

  # GET /user_files/1/edit
  def edit
  end

  # POST /user_files
  # POST /user_files.json
  def create
    @user_file = UserFile.new(user_file_params)
    @user_file.user_id = current_user.id
    respond_to do |format|
      if @user_file.save
        format.html { redirect_to user_files_url, alert: I18n.t('activerecord.models.user_file.model_util') + I18n.t('helpers_locale.models.created') }
        format.json { render action: 'show', status: :created, location: @user_file }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_files/1
  # PATCH/PUT /user_files/1.json
  def update
    respond_to do |format|
      if @user_file.update(user_file_params)
        format.html { redirect_to @user_file, alert: I18n.t('activerecord.models.user_file.model_util') + I18n.t('helpers_locale.models.updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_files/1
  # DELETE /user_files/1.json
  def destroy
    @user_file.destroy
    respond_to do |format|
      format.html { redirect_to user_files_url, alert: I18n.t('activerecord.models.user_file.model_util') + I18n.t('helpers_locale.models.deleted') }
      format.json { head :no_content }
    end
  end

  def download
    send_file(@user_file.file.path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_file
      @user_file = UserFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_file_params
      params.require(:user_file).permit(:user_id, :file, :name, :share, :note, :misc)
    end
end
