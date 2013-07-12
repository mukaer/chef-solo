init_user Cookbook
==================
TODO: Enter the cookbook description here.

e.g.
This cookbook makes your favorite breakfast sandwhich.

Requirements
------------
TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.

e.g.
#### packages
- `toaster` - init_user needs toaster to brown your bagel.

Attributes
----------
TODO: List you cookbook attributes here.

e.g.
#### init_user::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['init_user']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### init_user::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `init_user` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[init_user]"
  ],
 "init_user" :{
	 "deploy_auth_keys"   : ["ssh-rsa AAAAB3Nza.........ND1cIQ== mukaer@localhost.localdomain" ],
     "deploy_id_rsa"      : "-----BEGIN RSA PRIVATE KEY-----\nMIIEo.....3tPqVsbk=\n-----END RSA PRIVATE KEY-----\n",
	 "deploy_id_rsa_pub"  : "ssh-rsa AAAAB3Nza.....ka6A0w== mukaer@mukaer.com\n",
	 "deploy_known_hosts" : ["mukaer.com,123.123.123.123 ssh-rsa AAAAB3Nza..........SiscQ=="]
 }
}
```

```bsh
#command 
ruby -e 'p File.read("~/.ssh/id_rsa.pub")'
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
