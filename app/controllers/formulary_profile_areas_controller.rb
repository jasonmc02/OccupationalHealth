class FormularyProfileAreasController < ApplicationController
  before_action :set_formulary_profile_area, only: [:show, :edit, :update, :destroy]

  # GET /formulary_profile_areas
  # GET /formulary_profile_areas.json
  def index
    @formulary_profile_areas = FormularyProfileArea.all
  end

  # GET /formulary_profile_areas/1
  # GET /formulary_profile_areas/1.json
  def show
  end

  # GET /formulary_profile_areas/new
  def new
    @formulary_profile_area = FormularyProfileArea.new
  end

  # GET /formulary_profile_areas/1/edit
  def edit
  end

  # POST /formulary_profile_areas
  # POST /formulary_profile_areas.json
  def create
    @formulary_profile_area = FormularyProfileArea.new(formulary_profile_area_params)

    respond_to do |format|
      if @formulary_profile_area.save
        format.html { redirect_to @formulary_profile_area, notice: 'Formulary profile area was successfully created.' }
        format.json { render action: 'show', status: :created, location: @formulary_profile_area }
      else
        format.html { render action: 'new' }
        format.json { render json: @formulary_profile_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formulary_profile_areas/1
  # PATCH/PUT /formulary_profile_areas/1.json
  def update
    respond_to do |format|
      if @formulary_profile_area.update(formulary_profile_area_params)
        format.html { redirect_to @formulary_profile_area, notice: 'Formulary profile area was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @formulary_profile_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formulary_profile_areas/1
  # DELETE /formulary_profile_areas/1.json
  def destroy
    @formulary_profile_area.destroy
    respond_to do |format|
      format.html { redirect_to formulary_profile_areas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formulary_profile_area
      @formulary_profile_area = FormularyProfileArea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formulary_profile_area_params
      params.require(:formulary_profile_area).permit(:mining, :pesticide, :occupational_health, :community_paticipation, :watershed_management, :solid_waste_management, :public_health, :animal_health, :determinant_of_health, :food_sovereignty, :indigenous_health, :climate_change, :forest_management, :other)
    end
end
