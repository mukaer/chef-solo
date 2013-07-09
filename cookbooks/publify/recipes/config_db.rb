template "#{node[:publify][:app_root]}/config/database.yml" do
  source "database.yml.erb"
  variables({
              :adpter   => node[:publify][:db_adpter],
              :host     => node[:publify][:db_host],
              :username => node[:publify][:db_username],
              :password => node[:publify][:db_password],
              :encoding => node[:publify][:db_encoding]
              
            })
  user  node[:publify][:user]
  group node[:publify][:group]
  mode "0644"
end
