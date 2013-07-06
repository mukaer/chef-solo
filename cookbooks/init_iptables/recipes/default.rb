#
# Cookbook Name:: init_iptables
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

n = node[:init_iptables]

n.key?(:ips) ? ips = n[:ips] : ips = []
n.key?(:input_tcp_ports)  ? input_tcp_ports  = n[:input_tcp_ports]  : input_tcp_ports  = []
n.key?(:input_udp_ports)  ? input_udp_ports  = n[:input_udp_ports]  : input_udp_ports  = []
n.key?(:output_tcp_ports) ? output_tcp_ports = n[:output_tcp_ports] : output_tcp_ports = []
n.key?(:output_udp_ports) ? output_udp_ports = n[:output_udp_ports] : output_udp_ports = []

template "/usr/sbin/init-iptables" do
  source "init-iptables.erb"
  mode "0755"
  variables({
     :ips              =>  ips,
     :input_tcp_ports  =>  input_tcp_ports,
     :input_udp_ports  =>  input_udp_ports,
     :output_tcp_ports =>  output_tcp_ports,
     :output_udp_ports =>  output_udp_ports

  })
end


execute "iptables" do
  command "/usr/sbin/init-iptables"
end

