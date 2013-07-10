execute "gemfile overwirte"  do
  cwd  node[:publify][:app_root]
  not_if "grep unicorn Gemfile" ,  :cwd => node[:publify][:app_root]
  command "echo \"gem 'unicorn'\" >>  Gemfile"

end
