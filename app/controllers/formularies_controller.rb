class FormulariesController < ApplicationController
  before_action :set_formulary, only: [:show, :edit, :update, :destroy]

  # GET /formularies
  # GET /formularies.json
  def index
    if current_user.role_id == 1
      @formularies = Formulary.select('formularies.*, formulary_profiles.name, users.email').joins(:formulary_profile, :user).load
    else
      @formularies = Formulary.select('formularies.*, formulary_profiles.name, users.email').joins(:formulary_profile, :user).where("formularies.user_id = ?", current_user.id).load
    end
  end

  # GET /formularies/1
  # GET /formularies/1.json
  def show
  end

  # GET /formularies/new
  def new
    @formulary = Formulary.new

    @formulary.build_formulary_profile
    @formulary.build_formulary_context
    @formulary.build_formulary_research
    @formulary.build_formulary_action
    @formulary.build_formulary_policy
    @formulary.formulary_contacts.build

    @intersectoral_aspect = FormularyContext.intersectoral_aspect
    @project_term = FormularyContext.project_term
    @intersectoral_design_options = FormularyPolicy.intersectoral_design
    @project_result_options = FormularyPolicy.project_result
  end

  # GET /formularies/1/edit
  def edit
    @intersectoral_aspect = FormularyContext.intersectoral_aspect
    @project_term = FormularyContext.project_term
    @intersectoral_design_options = FormularyPolicy.intersectoral_design
    @project_result_options = FormularyPolicy.project_result
  end

  # POST /formularies
  # POST /formularies.json
  def create
    @formulary = Formulary.new(formulary_params)
    @formulary.user_id = current_user.id
    respond_to do |format|
      if @formulary.save
        format.html { redirect_to formularies_url, notice: 'Formulary was successfully created.' }
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
        format.html { redirect_to formularies_url, notice: 'Formulary was successfully updated.' }
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
      params.require(:formulary)
            .permit(
              :user_id,
              :formulary_profile_attributes => [:id, :formulary_id, :name, :project_begins, :project_ends, :region, :institution, :mining, :pesticide, :occupational_health, :community_paticipation, :watershed_management, :solid_waste_management, :public_health, :animal_health, :determinant_of_health, :food_sovereignty, :indigenous_health, :climate_change, :forest_management, :training, :other_areas, :which_areas, :project, :part_program, :entire_program, :other_project, :which_project, :objective, :discipline, :research, :action, :policy, :success],
              :formulary_contacts_attributes => [:id, :formulary_id, :_destroy, :name, :email, :phone, :project_role],
              :formulary_context_attributes => [:id, :formulary_id, :scale_description, :urban, :semiurban, :rural, :wilderness, :disrupted, :resource_extraction, :environmental_degradation, :climate_effect, :natural_force, :coastal, :agricultural, :forest, :rainfores, :cloud_forest, :dry_forest, :old_growth_forest, :mixed_forest, :other_scale, :which_scale, :watershed, :watersheed_name, :wetland, :desert, :intersectoral_aspect, :intersectoral_aspect_name, :political_jurisdiction, :political_jurisdictions_name, :sociopolitical_context, :local_context, :local_context_name, :project_affect, :project_affect_name, :role_consideration, :role_consideration_name, :key_actors, :success_consideration, :success_considerantion_name, :formulary_context_id, :project_term, :require_integration, :require_integration_name, :gender, :equity, :community_participation, :policy, :complexity, :other_approach, :which_approach],
              :formulary_research_attributes => [:id, :formulary_id, :interaction, :interaction_name, :integrate_investigation, :integrate_investigation_yes, :integrate_investigation_no, :test_hypothesis, :generate_knowledge, :inlcude_actor, :translate_knowledge, :influencing_legislation, :no_impact, :other_integration, :which_integration],
              :formulary_action_attributes => [:id, :formulary_id, :community_leader, :decision_maker, :other_research_group, :community_group, :ngos, :business, :church, :other_participation, :municipal_actors, :regional_actors, :national_actors, :other_actors, :none_actors, :entire_process, :research_part, :not_participatory_process, :factor_affects, :factor_affects_name, :implement, :implement_description, :new_methodologies, :new_methodologies_description, :other_incorporation, :other_incorporation_description, :influence, :influence_description, :develop_understanding, :including_actor, :enhancing_participation, :improving_communication, :other_changes, :none_changes, :local_impacts, :regional_impacts, :national_impacts, :international_impacts, :global_impacts],
              :formulary_policy_attributes => [:id, :formulary_id, :intersectoral_design, :improve_strategies, :prevent_strategies, :actor_strategies, :other, :other_description, :multiple_kind, :multiple_kind_name, :improve_policies, :project_result]
            )
    end
end
