package "monit" do
  action :install
  options "--force-yes"
end

template "monitrc" do
  path "/etc/monit/monitrc"
  source "monitrc.erb"
  owner "root"
  group "root"
  mode 0600
end

directory "/var/monit" do
  owner "root"
  group "root"
  mode  0700
end

cookbook_file "/etc/monit/ssh.monitrc" do
  source "ssh.monitrc"
  path "/etc/monit/ssh.monitrc"
end

cookbook_file "/etc/monit/openntp.monitrc" do
  source "openntp.monitrc"
  path "/etc/monit/openntp.monitrc"
end

cookbook_file "/etc/monit/filesystem.monitrc" do
  source "filesystem.monitrc"
  path "/etc/monit/filesystem.monitrc"
end

execute "set monit startup = 1" do
  command "echo 'startup=1' > /etc/default/monit"
end

execute "restart-monit" do
  command "pkill -9 monit && monit"
  action :nothing
end

service "monit" do
  action [:enable, :start]
end