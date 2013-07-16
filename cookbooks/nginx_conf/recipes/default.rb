#
# Cookbook Name:: nginx_conf
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory "/etc/nginx/conf.d/shared" do
  action :create
end


include_recipe "nginx_conf::confs"
include_recipe "nginx_conf::conf_default"

service "nginx" do
  action :reload
end
