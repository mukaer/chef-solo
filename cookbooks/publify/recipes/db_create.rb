cmd  = "su - #{node[:publify][:user]} -c '"
cmd += "source /etc/profile && cd #{node[:publify][:app_root]} "
cmd += "&& rake db:create "
cmd += " RAILS_ENV=#{node[:publify][:rails_env]}" unless node[:publify][:rails_env].empty?
cmd += "'"

execute "install command" do
  command cmd
end
