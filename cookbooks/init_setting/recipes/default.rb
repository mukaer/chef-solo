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


timezone = node[:init_setting][:timezone] if node[:init_setting].key?(:timezone)
execute "time zone" do
  command "ln -f /usr/share/zoneinfo/#{timezone} /etc/localtime ;hwclock --localtime --hctosys"
end unless  timezone.nil? || timezone.empty?


lang = node[:init_setting][:lang] if node[:init_setting].key?(:lang)
template "/etc/sysconfig/i18n" do
  source "sysconfig/i18n.erb"
  mode  "0644"
  variables({
     :lang => lang
  })
end unless lang.nil? || lang.empty?



execute "yum update" do
  command "yum -y update"
end

execute "yum groupinstall " do
  command 'yum -y groupinstall "Base" "Development Tools" '
end

package "yum-cron" do
  action :install
end

service "yum-cron" do
  action :enable
end

service "yum-cron" do
  action :start
end


packages = node[:init_setting][:packages] if node[:init_setting].key?(:packages)
packages.each do |pkg|
  package pkg do
    action :install
  end
end unless packages.nil?
