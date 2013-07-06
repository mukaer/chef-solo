init_iptables Cookbook
======================
TODO: Enter the cookbook description here.

e.g.
This cookbook makes your favorite breakfast sandwhich.

Requirements
------------
TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.

e.g.
#### packages
- `toaster` - init_iptables needs toaster to brown your bagel.

Attributes
----------
TODO: List you cookbook attributes here.

e.g.
#### init_iptables::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['init_iptables']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### init_iptables::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `init_iptables` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[init_iptables]"
  ],
 "init_iptables":{
	 "ips": ["192.168.0.0/24",
             "8.8.8.8"],
	 "input_tcp_ports":["80"],
	 "output_tcp_ports":["21","22","53","80","443","9418"],
	 "output_udp_ports":["53","123"]
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
