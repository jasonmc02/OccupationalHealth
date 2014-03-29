class FormularyContextDescriptionsController < ApplicationController
  before_action :set_formulary_context_description, only: [:show, :edit, :update, :destroy]

  # GET /formulary_context_descriptions
  # GET /formulary_context_descriptions.json
  def index
    @formulary_context_descriptions = FormularyContextDescription.all
  end

  # GET /formulary_context_descriptions/1
  # GET /formulary_context_descriptions/1.json
  def show
  end

  # GET /formulary_context_descriptions/new
  def new
    @formulary_context_description = FormularyContextDescription.new
  end

  # GET /formulary_context_descriptions/1/edit
  def edit
  end

  # POST /formulary_context_descriptions
  # POST /formulary_context_descriptions.json
  def create
    @formulary_context_description = FormularyContextDescription.new(formulary_context_description_params)

    respond_to do |format|
      if @formulary_context_description.save
        format.html { redirect_to @formulary_context_description, notice: 'Formulary context description was successfully created.' }
        format.json { render action: 'show', status: :created, location: @formulary_context_description }
      else
        format.html { render action: 'new' }
        format.json { render json: @formulary_context_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formulary_context_descriptions/1
  # PATCH/PUT /formulary_context_descriptions/1.json
  def update
    respond_to do |format|
      if @formulary_context_description.update(formulary_context_description_params)
        format.html { redirect_to @formulary_context_description, notice: 'Formulary context description was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @formulary_context_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formulary_context_descriptions/1
  # DELETE /formulary_context_descriptions/1.json
  def destroy
    @formulary_context_description.destroy
    respond_to do |format|
      format.html { redirect_to formulary_context_descriptions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formulary_context_description
      @formulary_context_description = FormularyContextDescription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formulary_context_description_params
      params.require(:formulary_context_description).permit(:formulary_context_id, :project_term, :require_integration, :require_integration_name, :gender, :equity, :community_participation, :policy, :complexity, :other)
    end
end
