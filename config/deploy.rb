# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'OccupationalHealth'
set :scm, :git
set :branch, :development
set :repo_url, 'git@github.com:jasonmc02/OccupationalHealth.git'
set :deploy_to, '/home/ubuntu/OccupationalHealth'
set :keep_releases, 3
set :pty, true

task :production do
  server 'ec2-54-186-30-232.us-west-2.compute.amazonaws.com'
end

task :test do
  server 'ec2-54-186-30-232.us-west-2.compute.amazonaws.com'
end
# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app


# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5


namespace :deploy do

  task :assets do
    
    run "rm -rf #{deploy_to}/current/public/assets"
    run "mkdir #{deploy_to}/config/assets"
    run "ln -s #{deploy_to}/config/assets #{deploy_to}/current/public/assets"

    run_locally "rake assets:precompile"
    run_locally "cd public; tar -zcvf assets.tar.gz assets"
    top.upload "public/assets.tar.gz", "#{deploy_to}/config/", :via => :scp
    run "cd #{deploy_to}/config/; tar -zxvf assets.tar.gz"
    run_locally "rm public/assets.tar.gz"
    run_locally "rm -rf public/assets"
  end

  desc "Symlink to db file"
  task :database do
    puts "Database configuration...\n"
    run "ln -nfs ~#{deploy_to}/shared/config/database.yml #{deploy_to}/current/config/database.yml"
  end

  desc "Run migration"
  task :migrate do
    puts "Running migrations...\n"
    run "cd #{deploy_to}/current && bundle exec rake db:migrate"
  end

  desc "Restart unicorn daemon"
  task :restart_unicorn do
    puts "Restarting unicorn...\n"
    run "#{sudo} service #{unicorn_daemon} restart"
  end

  desc "Restart memcached..."
  task :restart_memcached do
    puts "Restarting memcached...\n"
    run "#{sudo} service memcached restart"
  end

  desc "Restart Nginx server"
  task :restart_nginx do
    puts "Restarting nginx...\n"
    run "#{sudo} service nginx restart"
  end
end
