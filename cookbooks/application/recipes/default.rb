package "libmysqlclient-dev" do
  action :install
  options "--force-yes"
end

package "mysql-client" do
  action :install
  options "--force-yes"
end

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

directory "/var/www/actuable/shared/system" do
  owner "www-data"
  group "www-data"
  mode "0750"
  action :create
  not_if { Dir.exists?("/var/www/actuable/shared/system") }
end

directory "/var/www/actuable/shared/log" do
  owner "www-data"
  group "www-data"
  mode "0750"
  action :create
  not_if { Dir.exists?("/var/www/actuable/shared/log") }
end

directory "/var/www/actuable/shared/pids" do
  owner "www-data"
  group "www-data"
  mode "0750"
  action :create
  not_if { Dir.exists?("/var/www/actuable/shared/pids") }
end

directory "/var/www/actuable/shared/sitemaps" do
  owner "www-data"
  group "www-data"
  mode "0750"
  action :create
  not_if { Dir.exists?("/var/www/actuable/shared/sitemaps") }
end

directory "/var/www/actuable/shared/blog" do
  owner "www-data"
  group "www-data"
  mode "0750"
  action :create
  not_if { Dir.exists?("/var/www/actuable/shared/blog") }
end

directory "/var/www/actuable/shared/static" do
  owner "www-data"
  group "www-data"
  mode "0750"
  action :create
  not_if { Dir.exists?("/var/www/actuable/shared/static") }
end
