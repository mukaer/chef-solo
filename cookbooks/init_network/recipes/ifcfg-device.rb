#
# Cookbook Name:: init_network::ifcfg-device.rb
# 
#



ifcfg = node[:init_network][:ifcfg_device]

ifcfg.each do |val|

  device = val[:device]

  init = Initconf.new
  init.load_file("/etc/sysconfig/network-scripts/ifcfg-#{device}")


  val[:type].nil?    || val[:type].empty?    ? type     = init.get_value('TYPE')   : type = val[:type] 
  val[:onboot].nil?  || val[:onboot].empty?  ? onboot   = init.get_value('ONBOOT') : onboot = val[:onboot]
  val[:nm_controlled].nil? || val[:nm_controlled].empty? ? nm_controlled  = init.get_value('NM_CONTROLLED') : nm_controlled = val[:nm_controlled] 
  val[:bootproto].nil? || val[:bootproto].empty? ? bootproto  = init.get_value('BOOTPROTO') : bootproto = val[:bootproto]
  val[:ipaddr].nil?  || val[:ipaddr].empty?  ? ipaddr   = init.get_value('IPADDR')  : ipaddr  = val[:ipaddr]
  val[:netmask].nil? || val[:netmask].empty? ? netmask  = init.get_value('NETMASK') : netmask = val[:netmask]
  val[:prefix].nil?  || val[:prefix].empty?  ? prefix   = init.get_value('PREFIX')  : prefix  = val[:prefix] 
  val[:gateway].nil? || val[:gateway].empty? ? gateway  = init.get_value('GATEWAY') : gateway = val[:gateway]
  val[:dns1].nil?    || val[:dns1].empty?    ? dns1     = init.get_value('DNS1')    : dns1    = val[:dns1]
  val[:dns2].nil?    || val[:dns2].empty?    ? dns2     = init.get_value('DNS2')    : dns2    = val[:dns2]

  val[:others].nil?    || val[:dns2].empty?  ? others = [""]                        : others  = val[:others] 
  
  
  template "/etc/sysconfig/network-scripts/ifcfg-#{device}" do
    source "ifcfg-device.erb"
    mode "0644"
    variables({
                :device => device,
                :type   => type,
                :onboot => onboot,
                :nm_controlled => nm_controlled,
                :bootproto  => bootproto,
                :ipaddr  => ipaddr,
                :netmask => netmask,
                :prefix  => prefix,                
                :gateway => gateway,
                :dns1    => dns1,
                :dns2    => dns2,
                :others  => others
            })
  end
end unless ifcfg.nil? || ifcfg.empty?
