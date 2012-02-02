package "python-software-properties" #provides add-apt-repository
package "checkinstall"

execute "apt-get update" do
  command "apt-get update"
end
