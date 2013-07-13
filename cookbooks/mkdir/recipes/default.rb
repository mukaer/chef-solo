#
# Cookbook Name:: mkdir
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


node[:mkdir][:dirs].each do |dir|
  
  directory dir do
    action :create
    user  node[:mkdir][:user]
    group node[:mkdir][:group]
  end
  
end

