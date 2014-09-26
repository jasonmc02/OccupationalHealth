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
    if params[:file].content_type.to_s.eql?("text/x-sql")
      backup = params[:file]
      File.open(Rails.configuration.application_root + "/backup.sql", 'wb') do |file|
        file.write(backup.read)
      end
      `#{Rails.configuration.database_import} < #{Rails.configuration.application_root}backup.sql`
    end
    head :no_content
  end

  def release_memory
    #`sudo sysctl -w vm.drop_caches=3`
    #`sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches`
    ram = `free -m`
    ram = ram.split()
    resp = {}
    resp[:ram_total] = ram[7].to_i * 1048576
    resp[:ram_used] = ram[8].to_i * 1048576
    hdd = `df -m`
    hdd = hdd.split()
    resp[:hdd_total] = hdd[8].to_i * 1048576
    resp[:hdd_used] = hdd[9].to_i * 1048576
    render json: resp
  end
end