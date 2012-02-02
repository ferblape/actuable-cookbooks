include_recipe 'ssh'

cookbook_file "authorized keys for www-data" do
  path "/var/www/.ssh/authorized_keys"
  source "authorized_keys_www-data"
  owner "www-data"
  group "www-data"
  mode 0700
  not_if { File.exists?("/var/www/.ssh/authorized_keys") }
end