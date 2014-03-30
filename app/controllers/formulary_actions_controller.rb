class FormularyActionsController < ApplicationController
  before_action :set_formulary_action, only: [:show, :edit, :update, :destroy]

  # GET /formulary_actions
  # GET /formulary_actions.json
  def index
    @formulary_actions = FormularyAction.all
  end

  # GET /formulary_actions/1
  # GET /formulary_actions/1.json
  def show
  end

  # GET /formulary_actions/new
  def new
    @formulary_action = FormularyAction.new
  end

  # GET /formulary_actions/1/edit
  def edit
  end

  # POST /formulary_actions
  # POST /formulary_actions.json
  def create
    @formulary_action = FormularyAction.new(formulary_action_params)

    respond_to do |format|
      if @formulary_action.save
        format.html { redirect_to @formulary_action, notice: 'Formulary action was successfully created.' }
        format.json { render action: 'show', status: :created, location: @formulary_action }
      else
        format.html { render action: 'new' }
        format.json { render json: @formulary_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formulary_actions/1
  # PATCH/PUT /formulary_actions/1.json
  def update
    respond_to do |format|
      if @formulary_action.update(formulary_action_params)
        format.html { redirect_to @formulary_action, notice: 'Formulary action was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @formulary_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formulary_actions/1
  # DELETE /formulary_actions/1.json
  def destroy
    @formulary_action.destroy
    respond_to do |format|
      format.html { redirect_to formulary_actions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formulary_action
      @formulary_action = FormularyAction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formulary_action_params
      params.require(:formulary_action).permit(:formulary_id, :community_leader, :decision_maker, :other_research_group, :community_group, :ngos, :business, :church, :other, :municipal, :regiona, :national, :other, :none, :entire_process, :research_part, :not_participatory_process, :factor_affects, :factor_affects_name, :implement, :implement_description, :new_methodologies, :new_methodologies_description, :other_incorporation, :other_incorporation_description, :influence, :inlfuence_description, :develop_understanding, :including_actor, :enhancing_participation, :improving_communication, :other, :none, :local, :regional, :national, :international, :global)
    end
end
