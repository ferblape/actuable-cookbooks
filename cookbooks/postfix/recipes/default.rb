bash "install postfix" do
  code "DEBIAN_FRONTEND=noninteractive apt-get install --force-yes -y postfix"
  not_if "which postfix"
end

service "postfix" do
  service_name "postfix"
  supports :restart => true, :status => true, :reload => true
end

monit "postfix" do
  pid_file "/var/spool/postfix/pid/master.pid"
  start_program "/etc/init.d/postfix start"
  stop_program "/etc/init.d/postfix stop"
  alert "#{node[:monit][:alert_recipients]} only on { timeout }"
  checks <<-CHECKS
    if failed port 25 protocol smtp then restart
    if 5 restarts within 5 cycles then timeout
  CHECKS
end
