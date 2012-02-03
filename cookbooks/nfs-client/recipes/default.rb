package "nfs-common"
package "portmap"

cookbook_file "/etc/fstab" do
  path "/etc/fstab"
  source "fstab"
  owner "root"
  group "root"
  mode 0644
end