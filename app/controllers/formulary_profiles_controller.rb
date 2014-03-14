class FormularyProfilesController < ApplicationController
  before_action :set_formulary_profile, only: [:show, :edit, :update, :destroy]

  # GET /formulary_profiles
  # GET /formulary_profiles.json
  def index
    @formulary_profiles = FormularyProfile.all
  end

  # GET /formulary_profiles/1
  # GET /formulary_profiles/1.json
  def show
  end

  # GET /formulary_profiles/new
  def new
    @formulary_profile = FormularyProfile.new
  end

  # GET /formulary_profiles/1/edit
  def edit
  end

  # POST /formulary_profiles
  # POST /formulary_profiles.json
  def create
    @formulary_profile = FormularyProfile.new(formulary_profile_params)

    respond_to do |format|
      if @formulary_profile.save
        format.html { redirect_to @formulary_profile, notice: 'Formulary profile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @formulary_profile }
      else
        format.html { render action: 'new' }
        format.json { render json: @formulary_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formulary_profiles/1
  # PATCH/PUT /formulary_profiles/1.json
  def update
    respond_to do |format|
      if @formulary_profile.update(formulary_profile_params)
        format.html { redirect_to @formulary_profile, notice: 'Formulary profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @formulary_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formulary_profiles/1
  # DELETE /formulary_profiles/1.json
  def destroy
    @formulary_profile.destroy
    respond_to do |format|
      format.html { redirect_to formulary_profiles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formulary_profile
      @formulary_profile = FormularyProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formulary_profile_params
      params.require(:formulary_profile).permit(:name, :period, :region, :institution, :description, :objective, :discipline, :success)
    end
end
