# ======= Initial Config =============================

set :application, 'sliver.me'
set :use_sudo, true
set :user, 'internetchris'
set :port, 31979
set :domain, '174.143.148.37'
set :server_hostname, '174.143.148.37'
set :rails_env, :production
set :keep_releases, 3
set :scm, "git"
set :git_account, 'internetchris'
set :scm_passphrase,  Proc.new { Capistrano::CLI.password_prompt('GitHub Password:') }


default_run_options[:pty] = true
set :repository,  "git@github.com:#{git_account}/sliver.git"

#set :local_scm_command, "/usr/local/git/bin/git"
#set :scm_command, "/usr/local/bin/git"

ssh_options[:forward_agent] = true
set :branch, "master"
set :deploy_via, :remote_cache
set :git_shallow_clone, 1
set :git_enable_submodules, 1
set :deploy_to, "/home/internetchris/public_html/#{application}"

role :web, server_hostname
role :app, server_hostname
role :db, server_hostname, :primary => true


#=========== Database Setup (database.yml) =======================

before "deploy:setup", "db:configure"
after "deploy:update_code", "db:symlink"

set(:database_username, "root")
# set(:database_password, "root")
set(:development_database) { "sliver_development" }
set(:test_database) { "sliver_test" }
set(:production_database) { "sliver_production" }

namespace :db do
  desc "Create database yaml in shared path"
  task :configure do
    set :database_password do
      Capistrano::CLI.password_prompt "Database Password: "
    end

    db_config = <<-EOF
base: &base
  adapter: mysql
  encoding: utf8
  username: #{database_username}
  password: #{database_password}

development:
  database: #{development_database}
  <<: *base

test:
  database: #{test_database}
  <<: *base

production:
  database: #{production_database}
  <<: *base
    EOF

    run "mkdir -p #{shared_path}/config"
    put db_config, "#{shared_path}/config/database.yml"
  end

  desc "Make symlink for database yaml"
  task :symlink do
    run "ln -nfs #{shared_path}/config/database.yml #{latest_release}/config/database.yml"
  end


  deploy.task :restart, :roles => :app do
  run "touch #{current_path}/tmp/restart.txt"
end



end


