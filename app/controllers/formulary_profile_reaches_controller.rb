class FormularyProfileReachesController < ApplicationController
  before_action :set_formulary_profile_reach, only: [:show, :edit, :update, :destroy]

  # GET /formulary_profile_reaches
  # GET /formulary_profile_reaches.json
  def index
    @formulary_profile_reaches = FormularyProfileReach.all
  end

  # GET /formulary_profile_reaches/1
  # GET /formulary_profile_reaches/1.json
  def show
  end

  # GET /formulary_profile_reaches/new
  def new
    @formulary_profile_reach = FormularyProfileReach.new
  end

  # GET /formulary_profile_reaches/1/edit
  def edit
  end

  # POST /formulary_profile_reaches
  # POST /formulary_profile_reaches.json
  def create
    @formulary_profile_reach = FormularyProfileReach.new(formulary_profile_reach_params)

    respond_to do |format|
      if @formulary_profile_reach.save
        format.html { redirect_to @formulary_profile_reach, notice: 'Formulary profile reach was successfully created.' }
        format.json { render action: 'show', status: :created, location: @formulary_profile_reach }
      else
        format.html { render action: 'new' }
        format.json { render json: @formulary_profile_reach.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formulary_profile_reaches/1
  # PATCH/PUT /formulary_profile_reaches/1.json
  def update
    respond_to do |format|
      if @formulary_profile_reach.update(formulary_profile_reach_params)
        format.html { redirect_to @formulary_profile_reach, notice: 'Formulary profile reach was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @formulary_profile_reach.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formulary_profile_reaches/1
  # DELETE /formulary_profile_reaches/1.json
  def destroy
    @formulary_profile_reach.destroy
    respond_to do |format|
      format.html { redirect_to formulary_profile_reaches_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formulary_profile_reach
      @formulary_profile_reach = FormularyProfileReach.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formulary_profile_reach_params
      params.require(:formulary_profile_reach).permit(:research, :action, :policy)
    end
end
