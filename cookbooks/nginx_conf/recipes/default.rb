#
# Cookbook Name:: nginx_conf
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node[:nginx_conf].each do |c|

  template "/etc/nginx/conf.d/#{c[:conf_name]}.conf" do
    source "site.conf.erb"
    mode "0644"
    variables({
                :conf_name   => c[:conf_name],
                :listen      => c[:listen],
                :server_name => c[:server_name],
                :root        => c[:root],
                :servers     => c[:servers]
              })
                  
  end
end



service "nginx" do
  action :restart
end
