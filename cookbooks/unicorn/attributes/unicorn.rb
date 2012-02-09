set[:unicorn][:daemon] = "unicorn"
set[:unicorn][:daemon_options] = "-c /var/www/actuable/current/config/unicorn.rb -E production -D"
set[:unicorn][:pid_path] = "/var/www/actuable/shared/pids/unicorn.pid"
set[:unicorn][:app_path] = "/var/www/actuable/current"
