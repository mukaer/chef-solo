#
# Cookbook Name:: publify
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "publify::deploy_source"
include_recipe "publify::config_db"
include_recipe "publify::config_unicorn" if node[:publify][:conf_uc_overwrite]
include_recipe "publify::gemfile"        if node[:publify][:gemfile_overwrite]
include_recipe "publify::bundle_install"
include_recipe "publify::db_create"




