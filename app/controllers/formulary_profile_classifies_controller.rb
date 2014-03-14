class FormularyProfileClassifiesController < ApplicationController
  before_action :set_formulary_profile_classify, only: [:show, :edit, :update, :destroy]

  # GET /formulary_profile_classifies
  # GET /formulary_profile_classifies.json
  def index
    @formulary_profile_classifies = FormularyProfileClassify.all
  end

  # GET /formulary_profile_classifies/1
  # GET /formulary_profile_classifies/1.json
  def show
  end

  # GET /formulary_profile_classifies/new
  def new
    @formulary_profile_classify = FormularyProfileClassify.new
  end

  # GET /formulary_profile_classifies/1/edit
  def edit
  end

  # POST /formulary_profile_classifies
  # POST /formulary_profile_classifies.json
  def create
    @formulary_profile_classify = FormularyProfileClassify.new(formulary_profile_classify_params)

    respond_to do |format|
      if @formulary_profile_classify.save
        format.html { redirect_to @formulary_profile_classify, notice: 'Formulary profile classify was successfully created.' }
        format.json { render action: 'show', status: :created, location: @formulary_profile_classify }
      else
        format.html { render action: 'new' }
        format.json { render json: @formulary_profile_classify.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formulary_profile_classifies/1
  # PATCH/PUT /formulary_profile_classifies/1.json
  def update
    respond_to do |format|
      if @formulary_profile_classify.update(formulary_profile_classify_params)
        format.html { redirect_to @formulary_profile_classify, notice: 'Formulary profile classify was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @formulary_profile_classify.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formulary_profile_classifies/1
  # DELETE /formulary_profile_classifies/1.json
  def destroy
    @formulary_profile_classify.destroy
    respond_to do |format|
      format.html { redirect_to formulary_profile_classifies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formulary_profile_classify
      @formulary_profile_classify = FormularyProfileClassify.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formulary_profile_classify_params
      params.require(:formulary_profile_classify).permit(:project, :part_program, :entire_program, :other, :which)
    end
end
