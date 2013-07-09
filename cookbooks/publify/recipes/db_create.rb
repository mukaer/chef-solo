execute "install command" do
  command "su - #{node[:publify][:user]} -c 'source /etc/profile && cd #{node[:publify][:app_root]} && rake db:create'" 
end
