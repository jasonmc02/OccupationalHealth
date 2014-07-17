class UserFileSharesController < ApplicationController
  before_action :set_user_file_share, only: [:show, :edit, :update, :destroy]

  # GET /user_file_shares
  # GET /user_file_shares.json
  def index
    @user_file_shares = UserFileShare.all
  end

  # GET /user_file_shares/1
  # GET /user_file_shares/1.json
  def show
  end

  # GET /user_file_shares/new
  def new
    @user_file_share = UserFileShare.new
  end

  # GET /user_file_shares/1/edit
  def edit
  end

  # POST /user_file_shares
  # POST /user_file_shares.json
  def create
    @user_file_share = UserFileShare.new(user_file_share_params)

    respond_to do |format|
      if @user_file_share.save
        format.html { redirect_to @user_file_share, notice: 'User file share was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_file_share }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_file_share.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_file_shares/1
  # PATCH/PUT /user_file_shares/1.json
  def update
    respond_to do |format|
      if @user_file_share.update(user_file_share_params)
        format.html { redirect_to @user_file_share, notice: 'User file share was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_file_share.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_file_shares/1
  # DELETE /user_file_shares/1.json
  def destroy
    @user_file_share.destroy
    respond_to do |format|
      format.html { redirect_to user_file_shares_url }
      format.json { head :no_content }
    end
  end

  def fetch_user_file_shares
    @shares = UserFileShare.fetch_user_file_shares(params[:file_id], current_user.id)
    render json: @shares
  end

  def upsert_user_file_shares
    @shares = UserFileShare.upsert_user_file_shares(params[:users], params[:file_id], current_user.email)
    render json: @shares
  end

  def stop_sharing
    @shares = UserFileShare.stop_sharing(params[:id], current_user)
    redirect_to user_files_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_file_share
      @user_file_share = UserFileShare.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_file_share_params
      params.require(:user_file_share).permit(:user_id, :user_file_id)
    end
end
