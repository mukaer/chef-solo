#
# Cookbook Name:: init_network::host.rb
# 
#

init = Initconf.new
init.load_file '/etc/sysconfig/network'

if node[:init_network][:hostname].length > 0
  hostname = node[:init_network][:hostname]
else
  hostname = init.get_value['HOSTNAME']
end

template "/etc/sysconfig/network" do
  source "network.erb"
  mode "0644"
  variables({
     :hostname => hostname,
     :networking_ipv6 => init.get_value('NETWORKING_IPV6')
  })
end



template "/etc/host.conf" do
  source "host.conf.erb"
  mode "0644"
  variables({
     :host => node[:init_network][:host]
  })
end

 
template "/etc/hosts" do
  source "hosts.erb"
  mode "0644"
  variables({
     :hosts => node[:init_network][:hosts]
  })  
end
 
 
template "/etc/hosts.allow" do
  source "hosts.allow.erb"
  mode "0644"
  variables({
     :hosts_allow => node[:init_network][:hosts_allow]
  })  
end


template "/etc/hosts.deny" do
  source "hosts.deny.erb"
  mode "0644"
  variables({
     :hosts_deny => node[:init_network][:hosts_deny]
  })  
end
