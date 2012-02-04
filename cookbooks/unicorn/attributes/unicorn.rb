set[:unicorn][:version] = "4.2.0"
set[:unicorn][:daemon] = "/usr/local/bin/unicorn"
set[:unicorn][:daemon_options] = "-c /var/www/actuable/current/config/unicorn.rb -E production -D"
set[:unicorn][:pid_path] = "/var/www/actuable/shared/pids/unicorn.pid"
