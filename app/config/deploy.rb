set :application, "FauconDor"
set :domain,      "ftp.ixesn.fr"

# Multi Stage
set :branch, "master"
set :deploy_to, "/homez.635/esnfranc/www/annuaire"
set :symfony_env_prod, "dev"
set :php_bin, "/usr/local/php5.3/bin/php-cgi"

set :domain,      "ftp.ixesn.fr"
set :parameters_dir, "app/config/parameters"
set :parameters_file, false

set :app_path,    "app"
set :web_path,    "web"
set :user, "esnfranc"

set :repository,  "git@github.com:g33kteam/sf_faucondor.git"
set :scm,         :git

set :deploy_via, :copy
set :assets_symlinks, true
set :use_composer, false
set :interactive_mode, false

# OVH MUTU
set :copy_strategy, :export
set :copy_cache, "/tmp/#{application}"
set :copy_exclude, [".git/*"]
set :copy_compression, :gzip

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `subversion`, `mercurial`, `perforce`, or `none`

ssh_options[:forward_agent] = true

default_run_options[:pty] = true

set :model_manager, "doctrine"

role :web,        domain                         # Your HTTP server, Apache/etc
role :app,        domain, :primary => true       # This may be the same as your `Web` server
role :db,         domain, :primary => true       # This is where Symfony2 migrations will run

set  :keep_releases,  3

logger.level = Logger::MAX_LEVEL

set :shared_files, ["#{app_path}/config/parameters.yml"]
set :shared_children, ["#{app_path}/logs", "#{web_path}/uploads", "#{app_path}/sessions", "vendor", "#{web_path}/products"]
set :writable_dirs, ["#{app_path}/logs", "#{app_path}/cache"]
set :webserver_user, "www-data"
set :use_set_permissions, true
set :permission_method, :acl
set :use_sudo, false