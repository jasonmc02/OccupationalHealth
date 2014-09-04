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

  def backups
  end

  def create_backup
    name = "backup-#{Time.now.strftime("%Y-%m-%d")}.sql"
    command = `#{Rails.configuration.database_export}`
    File.open(Rails.configuration.application_root + name, "w+") do |file|
      file.write(command)
    end
    send_file(Rails.configuration.application_root + name)
  end

  def restore_backup
    backup = params[:file]
    File.open(Rails.configuration.application_root + "/backup.sql", 'wb') do |file|
      file.write(backup.read)
    end
    `#{Rails.configuration.database_import} < #{Rails.configuration.application_root}backup.sql`
    head :no_content
  end
end