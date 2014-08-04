# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'OccupationalHealth'
set :deploy_user, 'root'
set :scm, :git
set :branch, :development
set :repo_url, 'git@github.com:jasonmc02/OccupationalHealth.git'
set :deploy_to, '~/OccupationalHealth'
set :keep_releases, 3
set :pty, true

namespace :deploy do
=begin
  task :assets do
    on roles(:mailserver) do
      run "rm -rf #{deploy_to}/current/public/assets"
      run "mkdir #{deploy_to}/shared/assets"
      run "ln -s #{deploy_to}/shared/assets #{deploy_to}/current/public/assets"
      run_locally "rake assets:precompile"
      run_locally "cd public; tar -zcvf assets.tar.gz assets"
      top.upload "public/assets.tar.gz", "#{deploy_to}/shared/", :via => :scp
      run "cd #{deploy_to}/shared/; tar -zxvf assets.tar.gz"
      run_locally "rm public/assets.tar.gz"
      run_locally "rm -rf public/assets"
    end
  end
=end
  desc "Symlinks"
  task :symlinks do
    puts "Creating symlinks...\n"
    on roles(:web) do
      execute "sudo ln -s ~/OccupationalHealth/shared/database.yml ~/OccupationalHealth/current/config/"
      execute "sudo ln -s ~/OccupationalHealth/shared/configuration.yml ~/OccupationalHealth/current/config/"
      execute "sudo ln -s ~/OccupationalHealth/shared/unicorn.rb ~/OccupationalHealth/current/config/"
    end
  end

  desc "Railers"
  task :railers do
    puts "Running rails task...\n"
    on roles(:web) do
      execute "cd ~/OccupationalHealth/current/ && bundle install"
      execute "cd ~/OccupationalHealth/current/ && rake db:migrate RAILS_ENV=production"
    end
  end

  desc "Restarts"
  task :restarts do
    puts "Restarting workers...\n"
    on roles(:web) do
      execute "sudo service nginx restart"
      execute "sudo service occupational_health_unicorn_init stop"
      execute "sudo service occupational_health_unicorn_init start"
    end
  end

  after :finishing, 'deploy:symlinks'
  #after :finishing, 'deploy:railers'
  #after :finishing, 'deploy:restarts'

end
