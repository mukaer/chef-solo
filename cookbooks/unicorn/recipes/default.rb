#
# Cookbook Name:: unicorn
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


#service
include_recipe "unicorn::service"

#logrotate
include_recipe "unicorn::logrotate"




