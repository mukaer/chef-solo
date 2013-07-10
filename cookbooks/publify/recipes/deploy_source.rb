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


chmod_dirs = node[:publify][:chmod_dirs]

chmod_dirs.each do |path|
  directory "#{app_root}#{path}" do
    action :create
    user  node[:publify][:user]
    group node[:publify][:group]
    mode "0775"
  end
end





