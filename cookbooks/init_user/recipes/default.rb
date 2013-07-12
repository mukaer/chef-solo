#
# Cookbook Name:: init_user
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "init_user::deploy_user"
include_recipe "init_user::rake_user"
