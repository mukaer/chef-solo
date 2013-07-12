

apps = node[:unicorn][:apps]

apps.each do |app|
  
  app.key?(:pid)     ? pid    = app[:pid]    : pid    = "#{app[:root]}/tmp/unicorn.pid"
  app.key?(:log)     ? log    = app[:log]    : log    = "#{app[:root]}/log/*log"

  template "/etc/logrotate.d/unicorn_#{app[:name]}" do
    source "logrotate.d/unicorn.erb"
    mode "0755"
    variables({
                :group     => node[:unicorn][:group],
                :user      => node[:unicorn][:rake_user],
                :log       => log,
                :pid       => pid

              })
    
  end  
end
