class FormularyResearchesController < ApplicationController
  before_action :set_formulary_research, only: [:show, :edit, :update, :destroy]

  # GET /formulary_researches
  # GET /formulary_researches.json
  def index
    @formulary_researches = FormularyResearch.all
  end

  # GET /formulary_researches/1
  # GET /formulary_researches/1.json
  def show
  end

  # GET /formulary_researches/new
  def new
    @formulary_research = FormularyResearch.new
  end

  # GET /formulary_researches/1/edit
  def edit
  end

  # POST /formulary_researches
  # POST /formulary_researches.json
  def create
    @formulary_research = FormularyResearch.new(formulary_research_params)

    respond_to do |format|
      if @formulary_research.save
        format.html { redirect_to @formulary_research, notice: 'Formulary research was successfully created.' }
        format.json { render action: 'show', status: :created, location: @formulary_research }
      else
        format.html { render action: 'new' }
        format.json { render json: @formulary_research.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formulary_researches/1
  # PATCH/PUT /formulary_researches/1.json
  def update
    respond_to do |format|
      if @formulary_research.update(formulary_research_params)
        format.html { redirect_to @formulary_research, notice: 'Formulary research was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @formulary_research.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formulary_researches/1
  # DELETE /formulary_researches/1.json
  def destroy
    @formulary_research.destroy
    respond_to do |format|
      format.html { redirect_to formulary_researches_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formulary_research
      @formulary_research = FormularyResearch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formulary_research_params
      params.require(:formulary_research).permit(:formulary_id, :interaction, :interaction_name, :integrate_investigation, :integtrate_investigation_yes, :integrate_investigation_no, :test_hypothesis, :generate_knowledge, :inlcude_actor, :translate_knowledge, :influencing_legislation, :no_impact, :other)
    end
end
