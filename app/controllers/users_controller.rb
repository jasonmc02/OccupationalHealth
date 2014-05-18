class UsersController < ApplicationController
  before_action :set_user, only: [:update]

  def index
    @users = User.all
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'Formulary profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'index' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:id, :role_id)
    end
end