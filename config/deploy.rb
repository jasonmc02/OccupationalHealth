# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'OccupationalHealth'
set :deploy_user, 'ubuntu'
set :scm, :git
set :branch, :development
set :repo_url, 'git@github.com:jasonmc02/OccupationalHealth.git'
set :deploy_to, '/home/ubuntu/OccupationalHealth'
set :keep_releases, 3
set :pty, true

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

#after :finishing, :assets
#after :finishing, :bundle
#after "deploy", "deploy:database"
#after :finishing, :migrate

#after :finishing, 'deploy:bundle'#, 'deploy:database', 'deploy:migrate'

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

  desc "Install gems"
  task :bundle do
    on 'ubuntu@ec2-54-186-30-232.us-west-2.compute.amazonaws.com' do
      puts "Downloading gems"
      run "cd /#{deploy_to}/current && bundle install"
    end
  end

  desc "Symlink to db file"
  task :database do
    on 'ubuntu@ec2-54-186-30-232.us-west-2.compute.amazonaws.com' do
      puts "Database configuration...\n"
      run "ln -nfs ~#{deploy_to}/shared/shared/database.yml #{deploy_to}/current/shared/database.yml"
    end
  end

  desc "Run migration"
  task :migrate do
    on 'ubuntu@ec2-54-186-30-232.us-west-2.compute.amazonaws.com' do
      puts "Running migrations...\n"
      run "cd #{deploy_to}/current && bundle exec rake db:migrate"
    end
  end

  desc "Restart unicorn daemon"
  task :restart_unicorn do
    on 'ubuntu@ec2-54-186-30-232.us-west-2.compute.amazonaws.com' do
      puts "Restarting unicorn...\n"
      run "#{sudo} service #{unicorn_daemon} restart"
    end
  end

  desc "Restart memcached..."
  task :restart_memcached do
    on 'ubuntu@ec2-54-186-30-232.us-west-2.compute.amazonaws.com' do
      puts "Restarting memcached...\n"
      run "#{sudo} service memcached restart"
    end
  end

  desc "Restart Nginx server"
  task :restart_nginx do
    on 'ubuntu@ec2-54-186-30-232.us-west-2.compute.amazonaws.com' do
      puts "Restarting nginx...\n"
      run "#{sudo} service nginx restart"
    end
  end

  after :finishing, 'deploy:assets', 'deploy:bundle', 'deploy:database', 'deploy:migrate'
=end
end
