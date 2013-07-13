#
# Cookbook Name:: mysql_user
# Recipe:: grant
#

#  grant [:prive_type] on [:db_name].[:tbl_name] to [:user]@[:host] identified by '[:password]' [:require];


mcmd = Mysql_Command.new node[:mysql_user]

node[:mysql_user][:grant_users].each do |us|

  q_str  = " grant #{us[:prive_type]} "
  q_str += " on    #{us[:db_name]}.#{us[:tbl_name]} "
  q_str += " to    #{us[:user]}@#{us[:host]}"
  q_str += " identified by \"#{us[:password]}\""
  q_str += " require #{us[:require]}"  if us.key?(:require)
  
  mcmd.query q_str

  execute "mysql grant" do
    command mcmd.cmd 
  end
  
end

