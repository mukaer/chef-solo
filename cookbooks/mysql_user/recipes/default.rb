#
# Cookbook Name:: mysql_user
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "mysql_user::grant"
include_recipe "mysql_user::flush"
