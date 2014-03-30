class FormularyPoliciesController < ApplicationController
  before_action :set_formulary_policy, only: [:show, :edit, :update, :destroy]

  # GET /formulary_policies
  # GET /formulary_policies.json
  def index
    @formulary_policies = FormularyPolicy.all
  end

  # GET /formulary_policies/1
  # GET /formulary_policies/1.json
  def show
  end

  # GET /formulary_policies/new
  def new
    @formulary_policy = FormularyPolicy.new
  end

  # GET /formulary_policies/1/edit
  def edit
  end

  # POST /formulary_policies
  # POST /formulary_policies.json
  def create
    @formulary_policy = FormularyPolicy.new(formulary_policy_params)

    respond_to do |format|
      if @formulary_policy.save
        format.html { redirect_to @formulary_policy, notice: 'Formulary policy was successfully created.' }
        format.json { render action: 'show', status: :created, location: @formulary_policy }
      else
        format.html { render action: 'new' }
        format.json { render json: @formulary_policy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formulary_policies/1
  # PATCH/PUT /formulary_policies/1.json
  def update
    respond_to do |format|
      if @formulary_policy.update(formulary_policy_params)
        format.html { redirect_to @formulary_policy, notice: 'Formulary policy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @formulary_policy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formulary_policies/1
  # DELETE /formulary_policies/1.json
  def destroy
    @formulary_policy.destroy
    respond_to do |format|
      format.html { redirect_to formulary_policies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formulary_policy
      @formulary_policy = FormularyPolicy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formulary_policy_params
      params.require(:formulary_policy).permit(:formulary_id, :intersectoral_design, :improve_strategies, :prevent_strategies, :actor_strategies, :other, :other_description, :multiple_kind, :multiple_kind_name, :improve_policies, :project_result)
    end
end
