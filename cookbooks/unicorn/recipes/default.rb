template "/etc/init.d/unicorn" do
  source "init_d_unicorn.erb"
  mode 0644
  owner "root"
  group "root"
end

execute "chmod +x /etc/init.d/unicorn" do
  command "chmod +x /etc/init.d/unicorn"
  user "root"
end

execute "add to defaults" do
  command "/usr/sbin/update-rc.d -f unicorn defaults"
  user "root"
end

monit "unicorn" do
  pid_file @node[:unicorn][:pid_path]
  start_program "/etc/init.d/unicorn start"
  stop_program "/etc/init.d/unicorn stop"
  alert "#{node[:monit][:alert_recipients]} only on { timeout }"
end