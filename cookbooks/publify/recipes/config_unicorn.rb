gem_package "unicorn" do
  gem_binary "/opt/rbenv/shims/gem"
  action :install
end

template "#{node[:publify][:app_root]}/config/unicorn.rb" do
  source "unicorn.rb.erb"
  user  node[:publify][:user]
  group node[:publify][:group]
  mode "0644"

  variables({
              :worker_processes => node[:publify][:uc_worker_processes],              
              :port => node[:publify][:uc_port]
            })
end
