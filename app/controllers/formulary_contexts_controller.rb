class FormularyContextsController < ApplicationController
  before_action :set_formulary_context, only: [:show, :edit, :update, :destroy]

  # GET /formulary_contexts
  # GET /formulary_contexts.json
  def index
    @formulary_contexts = FormularyContext.all
  end

  # GET /formulary_contexts/1
  # GET /formulary_contexts/1.json
  def show
  end

  # GET /formulary_contexts/new
  def new
    @formulary_context = FormularyContext.new
  end

  # GET /formulary_contexts/1/edit
  def edit
  end

  # POST /formulary_contexts
  # POST /formulary_contexts.json
  def create
    @formulary_context = FormularyContext.new(formulary_context_params)

    respond_to do |format|
      if @formulary_context.save
        format.html { redirect_to @formulary_context, notice: 'Formulary context was successfully created.' }
        format.json { render action: 'show', status: :created, location: @formulary_context }
      else
        format.html { render action: 'new' }
        format.json { render json: @formulary_context.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formulary_contexts/1
  # PATCH/PUT /formulary_contexts/1.json
  def update
    respond_to do |format|
      if @formulary_context.update(formulary_context_params)
        format.html { redirect_to @formulary_context, notice: 'Formulary context was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @formulary_context.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formulary_contexts/1
  # DELETE /formulary_contexts/1.json
  def destroy
    @formulary_context.destroy
    respond_to do |format|
      format.html { redirect_to formulary_contexts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formulary_context
      @formulary_context = FormularyContext.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formulary_context_params
      params.require(:formulary_context).permit(:formulary_profile_id, :scale_description, :intersectoral_aspect, :intersectoral_aspect_name, :political_jurisdiction, :political_jurisdictions_name, :sociopolitical_context, :local_context, :local_context_name, :project_affect, :project_affect_name, :role_consideration, :role_consideration_name, :key_actors, :success_consideration, :success_considerantion_name)
    end
end
