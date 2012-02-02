include_recipe 'cron'

directory "/var/www" do
  owner "www-data"
  group "www-data"
  mode "0750"
  action :create
  not_if { Dir.exists?("/var/www") }
end

directory "/var/www/actuable" do
  owner "www-data"
  group "www-data"
  mode "0750"
  action :create
  not_if { Dir.exists?("/var/www/actuable") }
end

directory "/var/www/actuable/shared" do
  owner "www-data"
  group "www-data"
  mode "0750"
  action :create
  not_if { Dir.exists?("/var/www/actuable/shared") }
end