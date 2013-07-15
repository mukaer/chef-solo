#
# Cookbook Name:: nginx_conf
# Recipe:: default
#

node[:nginx_conf][:confs].each do |conf|

  template "/etc/nginx/conf.d/#{conf[:site_name]}.conf" do
    source "site.conf.erb"
    mode "0644"
    variables({
                :site_name   => conf[:site_name],
                :listen      => conf[:listen],
                :server_name => conf[:server_name],
                :root        => conf[:root],
                :servers     => conf[:servers]
              })
                  
  end
end
