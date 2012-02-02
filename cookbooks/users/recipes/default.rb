include_recipe 'ssh'

bash "create ubuntu user" do
  user "root"
  code "useradd -p ubuntu ubuntu; usermod -a -G admin ubuntu"
  not_if { Dir.exists?("/home/ubuntu") }
end

directory "/home/ubuntu/.ssh" do
  owner "ubuntu"
  group "ubuntu"
  mode "0750"
  action :create
  not_if { Dir.exists?("/home/ubuntu/.ssh") }
end

cookbook_file "authorized keys for ubuntu" do
  path "/home/ubuntu/.ssh/authorized_keys"
  source "authorized_keys_ubuntu"
  owner "ubuntu"
  group "ubuntu"
  mode 0700
  not_if { File.exists?("/home/ubuntu/.ssh/authorized_keys") }
end