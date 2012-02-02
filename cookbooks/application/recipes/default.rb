include_recipe 'cron'

directory "/var/www/actuable" do
  owner "ubuntu"
  group "ubuntu"
  mode "0750"
  action :create
  not_if { Dir.exists?("/var/www/actuable") }
end

directory "/var/www/actuable/shared" do
  owner "ubuntu"
  group "ubuntu"
  mode "0750"
  action :create
  not_if { Dir.exists?("/var/www/actuable/shared") }
end