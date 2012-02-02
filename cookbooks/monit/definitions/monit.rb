define :monit do
  file "/etc/monit/#{params[:name]}.monitrc" do
    action :delete
  end
  template "/etc/monit/#{params[:name]}.monitrc" do
    cookbook "monit"
    source "service.monitrc.erb"
    variables(:p => params)
    notifies :restart, resources(:service => "monit")
  end
end
