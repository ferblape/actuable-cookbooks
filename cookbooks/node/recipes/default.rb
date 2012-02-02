package 'curl'
package 'libssl-dev'

bash "Install node.js" do
  user "root"
  cwd "/tmp"
  not_if { File.exists?(`which node`.strip) }
  code <<-EOH
wget http://nodejs.org/dist/v#{@node[:node][:version]}/node-v#{@node[:node][:version]}.tar.gz
tar zxvf node-v#{@node[:node][:version]}.tar.gz
cd node-v#{@node[:node][:version]}
./configure --prefix=/usr/local
make
make install
EOH
end

bash "Install npm " do
  user "root"
  cwd "/tmp/"
  not_if { File.exists?(`which npm`.strip) }
  code <<-EOH
    cd /tmp
    curl http://npmjs.org/install.sh | clean=yes sh
  EOH
end
