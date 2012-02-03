include_recipe 'apt'
include_recipe 'monit'

bash "Install Redis" do
  user "root"
  not_if { File.exists?(`which redis-server`.strip) }
  code <<-EOH
cd /usr/local/src
wget http://redis.googlecode.com/files/redis-#{node[:redis][:version]}.tar.gz
tar zxvf redis-#{node[:redis][:version]}.tar.gz
cd redis-#{node[:redis][:version]}
./configure
make
checkinstall --pkgname redis --pkgversion #{node[:redis][:version]}-src --default
mkdir -p /etc/redis
adduser --system --no-create-home --disabled-login --disabled-password --group redis
mkdir -p /var/log/redis
chown redis: /var/log/redis
mkdir -p /var/lib/redis
chown redis: /var/lib/redis
EOH
end

template "/etc/init.d/redis-server" do
  source "redis-server.erb"
  mode 0755
  owner "root"
  group "root"
end

service "redis-server" do
  action :start
end

template "/etc/redis/redis.conf" do
  source "redis.conf.erb"
  mode 0644
  owner "root"
  group "root"
  notifies :restart, resources(:service => "redis-server")  , :immediately
end

logrotate "redis-server" do
  files "/var/log/redis/*.log"
  frequency "weekly"
  missing_ok
  compress
  delaycompress
  copytruncate
end

monit "redis-server" do
  pid_file "/var/run/redis.pid"
  start_program "/etc/init.d/redis-server start"
  stop_program "/etc/init.d/redis-server stop"
  alert "#{node[:monit][:alert_recipients]} only on { timeout }"
  checks <<-CHECKS
  if failed host 192.168.152.171 port #{node[:redis][:port]} then restart
  if 5 restarts within 5 cycles then timeout
CHECKS
end

directory "/var/lib/redis/backups" do
  owner "root"
  group "root"
  mode "0750"
  action :create
end

cookbook_file "backups script" do
  path "/var/lib/redis/backups.sh"
  source "backups.sh"
  owner "root"
  group "root"
  mode 0755
end

cron "backup redis database" do
  user "root"
  hour "4"
  minute "0"
  command "/var/lib/redis/backups.sh"
end

cron "archive Redis backups in S3" do
  user "root"
  hour "7"
  minute "0"
  command "/opt/backup-s3sync-ruby19/bin/s3sync -srv /var/lib/redis/backups/ toldo-system:backups"
  path "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
end