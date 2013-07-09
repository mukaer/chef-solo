app_root = node[:publify][:app_root]
root = File.dirname  app_root


directory root do
  action :create
  user  node[:publify][:user]
  group node[:publify][:group]
end


git app_root do
  repository node[:publify][:git_repository] 
  reference  node[:publify][:git_revison]
  action     :sync
  user       node[:publify][:user]
  group      node[:publify][:group]
end


directory "#{app_root}/tmp" do
  action :create
  user  node[:publify][:user]
  group node[:publify][:group]
end
