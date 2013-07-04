#
# Attributes:: default
#


#default['init_network']
default['init_network']['ipv6disable']    = false


default['init_network']['hostname']      = ""
default['init_network']['host']          = ["multi on"]

default['init_network']['hosts']         =
  ["127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4",
   "::1         localhost localhost.localdomain localhost6 localhost6.localdomain6"]

default['init_network']['hosts_allow']   = ["",""]
default['init_network']['hosts_deny']    = ["",""]



