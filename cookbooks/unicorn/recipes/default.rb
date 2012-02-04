gem_package "unicorn" do
  action :install
  version @node[:unicorn][:version]
end

template "/etc/init.d/unicorn" do
  source "init_d_unicorn.erb"
  mode 0644
  owner "root"
  group "root"
end

command "chmod +x /etc/init.d/unicorn" do
  execute "chmod +x /etc/init.d/unicorn"
  user "root"
end

command "add to defaults" do
  execute "/usr/sbin/update-rc.d -f unicorn defaults"
  user "root"
end

monit "unicorn" do
  pid_file @node[:unicorn][:pid_path]
  start_program "/etc/init.d/unicorn start"
  stop_program "/etc/init.d/unicorn stop"
  alert "#{node[:monit][:alert_recipients]} only on { timeout }"
end