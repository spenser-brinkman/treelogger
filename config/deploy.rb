# config valid for current version and patch releases of Capistrano
lock '~> 3.17.2'

set :application, 'treelogger'
set :repo_url, 'git@github.com:spenser-brinkman/treelogger.git'

set :rbenv_type, :user
set :rbenv_ruby, '3.2.1'

#set :pg_password, ENV['TREELOGGER_DATABASE_PASSWORD']
# set :pg_ask_for_password, true

set :nginx_server_name, 'spenserbrinkman.com'

# Default branch is :master
set :branch, 'main'

# Default deploy_to directory is /var/www/treelogger
# set :deploy_to, '/var/www/treelogger'

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files,
       'config/database.yml',
       'config/master.key',
       'config/credentials/production.key'

# Default value for linked_dirs is []
append :linked_dirs,
       'log',
       'tmp/pids',
       'tmp/cache',
       'tmp/sockets',
       'tmp/webpacker',
       'public/system',
       'vendor',
       'storage'

# Default value for default_env is {}
set :default_env, { 'RAILS_ENV' => fetch(:stage) }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

set :passenger_restart_command, 'sudo -n systemctl restart nginx'
set :passenger_restart_options, nil
