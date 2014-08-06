class HomeController < ApplicationController
  
  skip_before_filter :authenticate_user!, only: [:index]
  
  def index
  end

  def reports
    check_user_ability
    @intersectoral_design_options = FormularyPolicy.intersectoral_design
    @project_result_options = FormularyPolicy.project_result
    @project_term = FormularyContext.project_term
    @intersectoral_aspect = FormularyContext.intersectoral_aspect
    @formularies = []
  end

  def fetch_formularies
    @formularies = Formulary.fetch_formularies(params)
  end
end