include_recipe 'cron'

directory "/home/ubuntu/www" do
  owner "ubuntu"
  group "ubuntu"
  mode "0750"
  action :create
  not_if { Dir.exists?("/home/ubuntu/www") }
end

directory "/home/ubuntu/www/actuable" do
  owner "ubuntu"
  group "ubuntu"
  mode "0750"
  action :create
  not_if { Dir.exists?("/home/ubuntu/www/actuable") }
end

directory "/home/ubuntu/www/actuable/shared" do
  owner "ubuntu"
  group "ubuntu"
  mode "0750"
  action :create
  not_if { Dir.exists?("/home/ubuntu/www/actuable/shared") }
end