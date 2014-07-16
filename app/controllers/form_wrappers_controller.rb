class FormWrappersController < ApplicationController
  before_action :set_form_wrapper, only: [:show, :edit, :update, :destroy]

  # GET /form_wrappers
  # GET /form_wrappers.json
  def index
    @form_wrappers = FormWrapper.all.page(params[:page]).per(Rails.configuration.per_page)
  end

  # GET /form_wrappers/1
  # GET /form_wrappers/1.json
  def show
  end

  # GET /form_wrappers/new
  def new
    @form_wrapper = FormWrapper.new
    @form_wrapper.sections.build
  end

  # GET /form_wrappers/1/edit
  def edit
  end

  # POST /form_wrappers
  # POST /form_wrappers.json
  def create
    @form_wrapper = FormWrapper.new(form_wrapper_params)

    respond_to do |format|
      if @form_wrapper.save
        format.html { redirect_to new_custom_form_path(:form_wrapper_id => @form_wrapper.id), notice: 'Form wrapper was successfully created.' }
        format.json { render action: 'show', status: :created, location: @form_wrapper }
      else
        format.html { render action: 'new' }
        format.json { render json: @form_wrapper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /form_wrappers/1
  # PATCH/PUT /form_wrappers/1.json
  def update
    respond_to do |format|
      if @form_wrapper.update(form_wrapper_params)
        format.html { redirect_to form_wrappers_path, notice: 'Form wrapper was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @form_wrapper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /form_wrappers/1
  # DELETE /form_wrappers/1.json
  def destroy
    @form_wrapper.destroy
    respond_to do |format|
      format.html { redirect_to form_wrappers_url }
      format.json { head :no_content }
    end
  end

  def active
    FormWrapper.update_all(:active => false)
    FormWrapper.update(params[:id], :active => true)
    redirect_to form_wrappers_path
  end
  
  def deactive
    FormWrapper.update_all(:active => false)
    redirect_to form_wrappers_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_wrapper
      @form_wrapper = FormWrapper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_wrapper_params
      params.require(:form_wrapper).permit(:id, :title_en, :title_es, :title_fr, :title_pt, :description_en, :description_es, :description_fr, :description_pt,  :active,
                                           :sections_attributes => [:id, :form_wrapper_id, :title_en, :title_es, :title_fr, :title_pt, :description_en, :description_es, :description_fr, :description_pt, :sort_index]
                                          )
    end
end
