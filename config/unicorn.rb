working_directory "/home/ubuntu/OccupationalHealth/current"
rails_env = 'production'
pid "/home/ubuntu/OccupationalHealth/shared/tmp/pids/unicorn.pid"
stderr_path "/home/ubuntu/OccupationalHealth/shared/log/unicorn.log"
stdout_path "/home/ubuntu/OccupationalHealth/shared/log/unicorn.log"

listen "/tmp/unicorn.occupational_health.sock"
worker_processes 4
timeout 30
preload_app true

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
