init_network Cookbook
=====================


## ipv6 disable
     /etc/modprobe.d/ipv6block.conf
     /etc/sysconfig/network
   
## host
     /etc/sysconfig/network
     /etc/host.conf
     /etc/hosts
     /etc/hosts.allow
     /etc/hosts.dany
     
## dns
     /etc/resolv.conf
     
## ifcfg
     /etc/sysconfig/network-scripts/ifcfg-eth*


e.g.
This cookbook makes your favorite breakfast sandwhich.

Requirements
------------
TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.

e.g.
#### packages
- none

Attributes
----------
TODO: List you cookbook attributes here.

e.g.
#### init_network::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['init_network']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### init_network::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `init_network` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[init_network]"
  ],
 "init_network" :{
    "ipv6disable" : true,
    "hostname"    : "chef.mukaer.com",
    "host"        : ["multi on",
                     "order hosts,bind"],
    "hosts"       : ["127.0.0.1 localhost chef chef.mukaer.com",
                    "::1        localhost chef chef.mukaer.com"],
    "hosts_allow"  : ["ALL:127.0.0.1",
                      "ALL:192.168.0.0/255.255.255.0"],
    "hosts_deny"  : ["ALL:ALL"],

    "nameservers"  : ["8.8.8.8","8.8.4.4"],
	"resolv_others": [],
    
	"ifcfg_device": [ { "device"        :"eth0",
						"type"	        : "ethernet",
						"onboot"        : "yes",
						"nm_controlled" :"yes",
						"bootproto"     :"none",
						"ipaddr"        :"192.168.0.33",
						"netmask"       :"255.255.255.0",
						"gateway"       :"192.168.0.1",
						"dns1"          :"192.168.0.1",
						"dns2"          :"8.8.8.8",
	                    "others" :["#BRIDGE=br0",
                                   "#BONDING",
							       "#SLAVE=yes",
							       "#MASTER=bond0"]
					   }]
    }
    

}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors
