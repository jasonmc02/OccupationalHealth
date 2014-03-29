class FormularyContextEcosystemFeaturesController < ApplicationController
  before_action :set_formulary_context_ecosystem_feature, only: [:show, :edit, :update, :destroy]

  # GET /formulary_context_ecosystem_features
  # GET /formulary_context_ecosystem_features.json
  def index
    @formulary_context_ecosystem_features = FormularyContextEcosystemFeature.all
  end

  # GET /formulary_context_ecosystem_features/1
  # GET /formulary_context_ecosystem_features/1.json
  def show
  end

  # GET /formulary_context_ecosystem_features/new
  def new
    @formulary_context_ecosystem_feature = FormularyContextEcosystemFeature.new
  end

  # GET /formulary_context_ecosystem_features/1/edit
  def edit
  end

  # POST /formulary_context_ecosystem_features
  # POST /formulary_context_ecosystem_features.json
  def create
    @formulary_context_ecosystem_feature = FormularyContextEcosystemFeature.new(formulary_context_ecosystem_feature_params)

    respond_to do |format|
      if @formulary_context_ecosystem_feature.save
        format.html { redirect_to @formulary_context_ecosystem_feature, notice: 'Formulary context ecosystem feature was successfully created.' }
        format.json { render action: 'show', status: :created, location: @formulary_context_ecosystem_feature }
      else
        format.html { render action: 'new' }
        format.json { render json: @formulary_context_ecosystem_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formulary_context_ecosystem_features/1
  # PATCH/PUT /formulary_context_ecosystem_features/1.json
  def update
    respond_to do |format|
      if @formulary_context_ecosystem_feature.update(formulary_context_ecosystem_feature_params)
        format.html { redirect_to @formulary_context_ecosystem_feature, notice: 'Formulary context ecosystem feature was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @formulary_context_ecosystem_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formulary_context_ecosystem_features/1
  # DELETE /formulary_context_ecosystem_features/1.json
  def destroy
    @formulary_context_ecosystem_feature.destroy
    respond_to do |format|
      format.html { redirect_to formulary_context_ecosystem_features_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formulary_context_ecosystem_feature
      @formulary_context_ecosystem_feature = FormularyContextEcosystemFeature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formulary_context_ecosystem_feature_params
      params.require(:formulary_context_ecosystem_feature).permit(:formulary_context_id, :urban, :semiurban, :rural, :wilderness, :disrupted, :resource_extraction, :environmental_degradation, :climate_effect, :natural_force, :coastal, :agricultural, :forest, :rainfores, :cloud_forest, :dry_forest, :old_growth_forest, :mixed_forest, :other, :watershed, :watersheed_name, :wetland, :desert)
    end
end
