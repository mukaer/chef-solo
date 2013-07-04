#
# Cookbook Name:: init_network
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


if node[:init_network][:ipv6disable]
  include_recipe "init_network::ipv6disable"
end


include_recipe "init_network::host"


