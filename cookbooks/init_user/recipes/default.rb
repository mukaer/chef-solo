#
# Cookbook Name:: init_user
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


group "www" do
  action :create
end

user "deploy" do
  action :create
  gid "www"
end

group "wheel" do
  action :modify
  members "deploy"
  append true
end

if node[:init_user][:deploy_pubkey]

  user = "deploy"
  directory "/home/#{user}/.ssh" do
    owner user
    mode  "0700"
  end

  template  "/home/#{user}/.ssh/authorized_keys" do
    source "authorized_keys.erb"
    owner user
    mode "0600"
    variables({
                :key =>  node[:init_user][:deploy_pubkey]
              })
  end
end

user "unicron" do
  action :create
  gid "www"
end
