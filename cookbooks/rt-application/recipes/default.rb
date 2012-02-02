directory "/var/www" do
  owner "www-data"
  group "www-data"
  mode "0750"
  action :create
  not_if { Dir.exists?("/var/www") }
end

execute "clone repository" do
  command "git clone git://gist.github.com/1438024.git actuable-rt"
  not_if { Dir.exists?("/var/www/actuable-rt") }
end

execute "update the code" do
  command "cd /var/www/actuable-rt; git pull"
end

cookbook_file "server script" do
  path "/var/www/actuable-rt/server.sh"
  source "server.sh"
  owner "www-data"
  group "www-data"
  mode 0755
  not_if { Dir.exists?("/var/www/actuable-rt/server.sh") }
end

execute "reboot the server" do
  command "/var/www/actuable-rt/server.sh"
end