# netdata

[Netdata](https://www.netdata.cloud/) 是一種即時監控系統效能的軟體，通常被用來針對如網站伺服器、資料庫等重要應用網路服務或CPU、硬碟等硬體資源提供即時的效能監控。

## Installation

- Add to `/etc/apt/sources.list`
	- debian
		```
		deb http://repo.netdata.cloud/repos/stable/debian/ bookworm/
		deb https://repo.netdata.cloud/repos/repoconfig/debian bookworm/
		```

- Add apt key
	- Old way
	```
	# wget -qO - https://repo.netdata.cloud/netdatabot.gpg.key | apt-key add -
	# or
	# apt-key adv --fetch-keys https://repo.netdata.cloud/netdatabot.gpg.key

	# Export Key
	# apt-key list
	# apt-key export 65F56346 | gpg --dearmour -o /etc/apt/trusted.gpg.d/netdatabot.gpg
	```
	- New way?
	```
	wget -qO /etc/apt/trusted.gpg.d/netdatabot.gpg https://repo.netdata.cloud/netdatabot.gpg.key
	```

- Install
	```
	# apt update
	# apt install netdata
	```

- Install Plugins
	```
	# netdata-plugin-freeipmi netdata-plugin-apps netdata-plugin-network-viewer
	```
