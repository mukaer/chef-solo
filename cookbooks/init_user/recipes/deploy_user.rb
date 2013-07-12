#
# Cookbook Name:: init_user
# Recipe:: default
#

node_group       = node[:init_user][:group]
node_group_wheel = node[:init_user][:group_wheel]
node_user        = node[:init_user][:user]

group node_group do
  action :create
end

user node_user do
  action :create
  gid node_group
end

group node_group_wheel  do
  action :modify
  members node_user
  append true
end


directory "/home/#{node_user}/.ssh" do
  owner node_user
  mode  "0700"
end


# authorized_keys  
template  "/home/#{node_user}/.ssh/authorized_keys" do
  source "authorized_keys.erb"
  owner node_user
  group node_group
  mode "0600"
  variables({
              :keys =>  node[:init_user][:deploy_auth_keys]
            })
end


# id_rsa
template  "/home/#{node_user}/.ssh/id_rsa" do
  source "id_rsa.erb"
  owner node_user
  group node_group
  mode "0600"
  variables({
              :key =>  node[:init_user][:deploy_id_rsa]
            })
end


# id_rsa.pub
template  "/home/#{node_user}/.ssh/id_rsa.pub" do
  source "id_rsa.pub.erb"
  owner node_user
  group node_group
  mode "0600"
  variables({
              :key =>  node[:init_user][:deploy_id_rsa_pub]
            })
end


# known_hosts
template  "/home/#{node_user}/.ssh/known_hosts" do
  source "known_hosts.erb"
  owner node_user
  group node_group
  mode "0600"
  variables({
              :keys =>  node[:init_user][:deploy_known_hosts]
            })
end
