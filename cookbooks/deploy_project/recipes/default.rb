#
# Cookbook Name:: deploy_project
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


node[:deploy_project][:projects].each do |pj|
  
  git pj[:app_root] do
    repository pj[:git_repository] 
    reference  pj[:git_revison]
    action     :sync
    user       node[:deploy_project][:user]
    group      node[:deploy_project][:group]
  end

  pj[:commands].each do |cmd|
    execute "command" do
      command cmd
    end
  end

  
end



