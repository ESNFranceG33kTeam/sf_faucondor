set   :application,   "faucondor"
set   :deploy_to,     "/volume1/www/faucondor"
set   :domain,        "thebestcolocever.no-ip.org"
set   :user,          "root"
set   :scm,           :git
set   :repository,    "https://github.com/ESNFranceG33kTeam/sf_faucondor.git"

set :deploy_via, :remote_cache

role  :web,           domain
role  :app,           domain, :primary => true

set   :use_sudo,      false
set   :keep_releases, 3

after "deploy", "deploy:cleanup"