require 'bundler/capistrano'
require 'rvm/capistrano'

set :application, 'blog'
set :repository,  'git@github.com:kbassiri/blog.git'
set :branch, ENV['BRANCH'] || "master"
set :rvm_ruby_string, 'ruby-1.9.3-p385@blog'
set :rvm_type, :system
set :rails_env, 'production'

require 'capistrano-unicorn'

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

gserver = 'aws'
role :web,  gserver                         # Your HTTP server, Apache/etc
role :app,  gserver                         # This may be the same as your `Web` server
role :db,  gserver, :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

#set :user, 'ubuntu'
#set :group, 'staff'
set :use_sudo, false
set :keep_releases, 6
set :bundle_without, [:development, :test, :deploy]

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :generate_rvmrc do
   # run "echo 'rvm use ruby-1.9.3-p385@blog' > #{release_path}/.rvmrc"
  end
end

after 'deploy:update_code', 'deploy:generate_rvmrc'
#after 'deploy:rollback', 'deploy:restart'

#after 'deploy:restart', 'unicorn:reload'  # app preloaded

