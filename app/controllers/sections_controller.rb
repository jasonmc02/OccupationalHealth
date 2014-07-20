class SectionsController < ApplicationController
  before_action :check_user_ability
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  # GET /sections
  # GET /sections.json
  def index
    @sections = Section.all
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
  end

  # GET /sections/new
  def new
    @section = Section.new
    @form_wrapper = FormWrapper.find(params[:form_wrapper_id])
  end

  # GET /sections/1/edit
  def edit
    @form_wrapper = FormWrapper.find(@section.form_wrapper_id)
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(section_params)

    respond_to do |format|
      if @section.save
        @section.check_index()
        form_wrapper = FormWrapper.find(@section.form_wrapper_id)
        format.html { redirect_to sections_section_path(form_wrapper), notice: 'Form wrapper was successfully created.' }
        format.json { render action: 'show', status: :created, location: @section }
      else
        format.html { render action: 'new' }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
    respond_to do |format|
      if @section.update(section_params)
        @section.check_index()
        form_wrapper = FormWrapper.find(@section.form_wrapper_id)
        format.html { redirect_to sections_section_path(form_wrapper), notice: 'Section was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section.destroy
    respond_to do |format|
      form_wrapper = FormWrapper.find(@section.form_wrapper_id)
      format.html { redirect_to sections_section_path(form_wrapper) }
      format.json { head :no_content }
    end
  end

  def sections
    @form_wrapper = FormWrapper.find(params[:id])
    @sections = @form_wrapper.sections.order(:sort_index).page(params[:page]).per(Rails.configuration.per_page)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:id, :form_wrapper_id, :title_en, :title_es, :title_fr, :title_pt, :description_en, :description_es, :description_fr, :description_pt, :sort_index)
    end
end
