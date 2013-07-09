execute "bundle install" do
  cwd     node[:publify][:app_root]
  command "source /etc/profile && bundle install --system "
end


# TODO replace
#  
# Gemfile Do'n system install. why?
# >> gem 'prototype_legacy_helper', '0.0.0', :git => 'git://github.com/rails/prototype_legacy_helper.git'
execute "bundle install user" do
  command "su - #{node[:publify][:user]} -c 'source /etc/profile && cd #{node[:publify][:app_root]} && bundle install --local'"

  #Don'nt support user. linux command env $USER
  # user node[:publify][:user]
end
execute "bundle install rack_user" do
  command "su - #{node[:publify][:rack_user]} -c 'source /etc/profile && cd #{node[:publify][:app_root]} && bundle install --local'"
  
end

 


