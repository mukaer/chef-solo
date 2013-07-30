chef-solo
=========
chef-solo . it's esay setup server . user iptables ntp ruby nginx mysql publiffy git_project unicorn

* CnetOS 6
* selinux::disabled
* init_network
* init_user
* init_setting
* init_iptables
* ntp
* mysql
* mysql::server
* mysql_user
* rbenv
* ruby
* mkdir
* nginx
* nginx_conf
* publify        (ruby on rails blog engine)
* deploy_project (git project & command setup)
* unicorn



Install
------

### 1.Chef key

* [OPSCODE](berks install --path site-cookbooks)
Download & install Chef

~/.chef/
   knife.rb
   mukaer-validator.pem
   mukaer.pem

### 2.Get Code

```bsh
cd ~/
git clone https://github.com/mukaer/chef-solo.git
cd chef-solo
gem install bundle
berks install --path site-cookbooks
```

Use
---

Boot Setup server.

```
knife solo prepare  chef@192.168.0.33
```

edit `nodes/192.168.0.63.json` or show example `nodes/example.json`

```json
{"run_list":[
	 "init_user",
     "ntp",
     "mysql",
	 "rbenv",
	 "ruby",
     "deploy_project"
 ],
 
 "init_user" :{
	 "deploy_auth_keys": ["ssh-rsa AAAAB3Nz....xND1cIQ== kaimu@dev.localdomain" ],
     "deploy_id_rsa": "-----BEGIN RSA PRIVATE KEY-----\nMIIEo...PqVsbk=\n-----END RSA PRIVATE KEY-----\n",
	 "deploy_id_rsa_pub"  :"ssh-rsa AAAAB3NzaC1yA...lPbrka6A0w== deploy@chef.mukaer.com\n",
	 "deploy_known_hosts" : ["mukaer.com,115.179.0.91 ssh-rsa AAAAB3.....NzaC1yijSiscQ=="]
 },
 
 "ntp" :{
	 "servers" :["ntp.nict.jp","ntp.ring.gr.jp","0.jp.pool.ntp.org","1.jp.pool.ntp.org","2.jp.pool.ntp.org"]
 },

 "deploy_project" : {
	 "projects" : [{
					   "app_root"       : "/var/www/gengou.jp/app",
					   "git_repository" : "https://github.com/mukaer/gengou.jp.git",
					   "git_revison"    : "master",
					   "commands"       : [
						   "cd /var/www/gengou.jp/app ; source /etc/profile && bundle install --system",
						   "chmod 775 /var/www/gengou.jp/app/tmp",
						   "chmod 775 /var/www/gengou.jp/app/log"
					   ]

	 }]

 }
 }
```


```
knife solo cook chef@192.168.0.63
```
