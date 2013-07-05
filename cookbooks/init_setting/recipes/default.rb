#
# Cookbook Name:: init_setting
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


template "/etc/ssh/sshd_config" do
  source "ssh/sshd_config"
  mode  "0644"

end  


template "/etc/pam.d/su" do
  source "pam.d/su"
  mode  "0644"

end  
