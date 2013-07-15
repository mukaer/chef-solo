#
# Cookbook Name:: nginx_conf
# Recipe:: default
#


file "/etc/nginx/conf.d/default.conf" do
  action :delete
end if node[:nginx_conf][:default_conf_disabled] 


template "/etc/nginx/conf.d/default.conf" do
  source "default.conf"
end  unless node[:nginx_conf][:default_conf_disabled]

