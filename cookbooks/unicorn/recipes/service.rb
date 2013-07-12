
apps = node[:unicorn][:apps]

apps.each do |app|

  app.key?(:start_command) ? scmd = app[:start_command] : scmd = node[:unicorn][:start_command]
  app.key?(:pid)     ? pid    = app[:pid]    : pid    = "#{app[:root]}/tmp/unicorn.pid"
  app.key?(:config)  ? config = app[:config] : config = "#{app[:root]}/config/unicorn.rb"

  template "/etc/init.d/unicorn_#{app[:name]}" do
    source "init.d/unicorn.erb"
    mode "0755"
    variables({
                :user      => node[:unicorn][:rake_user],
                :name      => app[:name],
                :root      => app[:root],
                :env       => app[:env],
                :start_cmd => scmd,
                :pid       => pid,
                :config    => config
              })
    
  end


  service "unicorn_#{app[:name]}" do
    action [:enable,:start]
  end
  
end


