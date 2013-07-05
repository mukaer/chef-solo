#
# Cookbook Name:: init_network::dns.rb
# 
#

nameservers = node[:init_network][:nameservers] if node[:init_network].key?(:nameservers)

node[:init_network].key?(:resolv_others) ? resolv_others = node[:init_network][:resolv_others] : resolv_others  = []

template "/etc/resolv.conf" do
  source "resolv.conf.erb"
  mode "0644"
  variables({
     :nameservers => nameservers,
     :resolv_others => resolv_others

  })
end unless  nameservers.nil?
