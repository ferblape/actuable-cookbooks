package "nfs-common" do
  action :install
  options "--force-yes"
end

package "portmap" do
  action :install
  options "--force-yes"
end


cookbook_file "/etc/fstab" do
  path "/etc/fstab"
  source "fstab"
  owner "root"
  group "root"
  mode 0644
end