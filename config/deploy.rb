default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :user, "www-data"

# act01 is not managed using Chef
# set :act01, "178.79.171.223"
set :act02, "109.74.195.67"
set :act03, "178.79.169.135"
set :act04, "178.79.187.31"

role :rt,  act02
role :app, act02, act03, act04

set :chef_path, "/var/www/.chef/actuable-cookbooks"

desc "Run Chef cookbooks"
task :chef do
  run "cd #{chef_path}; git pull"
  sudo "chef-solo -j #{chef_path}/roles/rt.json  -c #{chef_path}/solo.rb",  :roles => :rt
  sudo "chef-solo -j #{chef_path}/roles/app.json -c #{chef_path}/solo.rb",  :roles => :app
end