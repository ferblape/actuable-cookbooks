cookbook_file "/etc/init.d/iptables.sh" do
  source "iptables.sh"
  owner "root"
  group "root"
  mode "0755"
  action :create
end

execute "set firewall" do
  command "/etc/init.d/iptables.sh"
end
