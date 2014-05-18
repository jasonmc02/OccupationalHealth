class FormularyContactsController < ApplicationController
  before_action :set_formulary_contact, only: [:show, :edit, :update, :destroy]

  # GET /formulary_contacts
  # GET /formulary_contacts.json
  def index
    @formulary_contacts = FormularyContact.all
  end

  # GET /formulary_contacts/1
  # GET /formulary_contacts/1.json
  def show
  end

  # GET /formulary_contacts/new
  def new
    @formulary_contact = FormularyContact.new
  end

  # GET /formulary_contacts/1/edit
  def edit
  end

  # POST /formulary_contacts
  # POST /formulary_contacts.json
  def create
    @formulary_contact = FormularyContact.new(formulary_contact_params)

    respond_to do |format|
      if @formulary_contact.save
        format.html { redirect_to @formulary_contact, notice: 'Formulary contact was successfully created.' }
        format.json { render action: 'show', status: :created, location: @formulary_contact }
      else
        format.html { render action: 'new' }
        format.json { render json: @formulary_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formulary_contacts/1
  # PATCH/PUT /formulary_contacts/1.json
  def update
    respond_to do |format|
      if @formulary_contact.update(formulary_contact_params)
        format.html { redirect_to @formulary_contact, notice: 'Formulary contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @formulary_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formulary_contacts/1
  # DELETE /formulary_contacts/1.json
  def destroy
    @formulary_contact.destroy
    respond_to do |format|
      format.html { redirect_to formulary_contacts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formulary_contact
      @formulary_contact = FormularyContact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formulary_contact_params
      params.require(:formulary_contact).permit(:formulary_id, :name, :email, :phone, :project_role)
    end
end
