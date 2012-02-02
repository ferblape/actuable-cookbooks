cron "clean tmp" do
  hour "4"
  minute "0"
  command "find /tmp -mtime 3 -print | xargs /bin/rm -rf"
end
