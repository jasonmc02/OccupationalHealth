class HomeController < ApplicationController
  
  skip_before_filter :authenticate_user!, only: [:index]
  before_filter :check_user_ability, except: [:index]
  
  def index
  end

  def reports
    @intersectoral_design_options = FormularyPolicy.intersectoral_design
    @project_result_options = FormularyPolicy.project_result
    @project_term = FormularyContext.project_term
    @intersectoral_aspect = FormularyContext.intersectoral_aspect
    @formularies = []
  end

  def stats
    ram = `free -m`
    ram = ram.split()
    @ram_total = ram[7].to_i * 1048576
    @ram_used = ram[8].to_i * 1048576
    hdd = `df -m`
    hdd = hdd.split()
    @hdd_total = hdd[8].to_i * 1048576
    @hdd_used = hdd[9].to_i * 1048576
  end

  def fetch_formularies
    @formularies = Formulary.fetch_formularies(params)
  end
end