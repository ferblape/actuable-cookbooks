cookbook_file "sshd config" do
  path "/etc/ssh/sshd_config"
  source "sshd_config"
  owner "root"
  group "root"
  mode 0755
end

bash "restart service" do
  user "root"
  code "service ssh restart"
end