home = "/home/ubuntu/OccupationalHealth/current"

working_directory home
rails_env = 'production'
pid "#{home}/tmp/pids/unicorn.pid"

stderr_path "#{home}/log/stderr_unicorn.log"
stdout_path "#{home}/log/stdout_unicorn.log"

listen "/tmp/occupational_health.sock"
worker_processes 4
timeout 30
preload_app true

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
