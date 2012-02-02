include_recipe 'ssh'

cookbook_file "authorized keys for ubuntu" do
  path "/home/ubuntu/.ssh/authorized_keys"
  source "authorized_keys_ubuntu"
  owner "ubuntu"
  group "ubuntu"
  mode 0700
  not_if { File.exists?("/home/ubuntu/.ssh/authorized_keys") }
end