#
# Cookbook Name:: mysql_user
# Recipe:: flush.rb

mcmd = Mysql_Command.new node[:mysql_user]

execute "mysql flush privileges" do
  mcmd.query  "flush privileges;"  
  command mcmd.cmd 
end

