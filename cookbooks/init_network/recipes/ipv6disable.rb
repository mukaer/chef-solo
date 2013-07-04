#
# Cookbook Name:: init_network::ipv6disable.rb
# 
#

#execute "ipv6 disable" do
#  command "/sbin/chkconfig ip6tables off"
# 
#end

service "ip6tables" do
  action :stop 
end

service "ip6tables" do
  action :disable
end


template "/etc/modprobe.d/ipv6block.conf" do
  source "ipv6block.conf.erb"
  mode "0644"
end


init = Initconf.new
init.load_file '/etc/sysconfig/network'

template "/etc/sysconfig/network" do
  source "network.erb"
  mode "0644"
  variables({
     :hostname => init.get_value('HOSTNAME'),
     :networking_ipv6 => 'no'
  })
end
