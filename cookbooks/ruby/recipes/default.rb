#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

RUBY_VER= node[:ruby][:version]

include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"
include_recipe "rbenv::rbenv_vars"


packages = "sqlite-devel mysql-devel libxml2-devel libxslt-devel"
packages.split(" ").each do |pkg|
  package pkg
end


rbenv_ruby RUBY_VER

rbenv_gem "bundler" do
  ruby_version RUBY_VER
end  

execute "rbenv global" do
  command "source /etc/profile  && rbenv global  #{RUBY_VER}"  
end
