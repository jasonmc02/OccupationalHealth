class FormulariesController < ApplicationController
  before_action :set_formulary, only: [:show, :edit, :update, :destroy]

  # GET /formularies
  # GET /formularies.json
  def index
    @formularies = Formulary.all
  end

  # GET /formularies/1
  # GET /formularies/1.json
  def show
  end

  # GET /formularies/new
  def new
    @formulary = Formulary.new

    @formulary.build_formulary_profile
    #@formulary.formulary_profile.build_formulary_profile_area
    @formulary.build_formulary_context
    @formulary.build_formulary_research
    @formulary.build_formulary_action
    @formulary.build_formulary_policy

    @context_options = FormularyContext.optionsa
    @description_options = FormularyContext.optionsb
    @intersectoral_design_options = FormularyPolicy.intersectoral_design
    @project_result_options = FormularyPolicy.project_result
  end

  # GET /formularies/1/edit
  def edit
  end

  # POST /formularies
  # POST /formularies.json
  def create
    @formulary = Formulary.new(formulary_params)

    respond_to do |format|
      if @formulary.save
        format.html { redirect_to @formulary, notice: 'Formulary was successfully created.' }
        format.json { render action: 'show', status: :created, location: @formulary }
      else
        format.html { render action: 'new' }
        format.json { render json: @formulary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formularies/1
  # PATCH/PUT /formularies/1.json
  def update
    respond_to do |format|
      if @formulary.update(formulary_params)
        format.html { redirect_to @formulary, notice: 'Formulary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @formulary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formularies/1
  # DELETE /formularies/1.json
  def destroy
    @formulary.destroy
    respond_to do |format|
      format.html { redirect_to formularies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formulary
      @formulary = Formulary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formulary_params
      params.require(:formulary).permit(:user_id)
    end
end
