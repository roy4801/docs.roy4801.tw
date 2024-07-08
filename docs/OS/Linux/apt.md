# apt

## Mirror

Switch to [twds mirror](https://mirror.twds.com.tw/)

- debian
	```
	# sed -i 's|http://deb.debian.org|https://mirror.twds.com.tw|g' sources.list
	# sed -i 's|http://security.debian.org|https://mirror.twds.com.tw/debian-security|g' sources.list
	```

- pve
	- Use debian script
	- Disable PVE-Enterperise
	- LXC template src
		```
		# cp /usr/share/perl5/PVE/APLInfo.pm /usr/share/perl5/PVE/APLInfo.pm_back
		# sed -i 's|http://download.proxmox.com|https://mirror.twds.com.tw/proxmox|g' /usr/share/perl5/PVE/APLInfo.pm
		# systemctl restart pvedaemon
		```

## Ref

PVE系列-更换软件&容器源
<https://gvnote.com/p/replace-lxc-container-source/>
