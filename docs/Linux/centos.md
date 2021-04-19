# CentOS

## Install htop

```bash
sudo yum -y install epel-release && sudo yum -y update
sudo yum -y install htop
```

## Firewall

```
sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --zone=public --permanent --add-port=8080/tcp
sudo firewall-cmd --reload
```

## Register as a service

* Write a `xxx.service` file and put it into `/etc/systemd/system/xxx.service`

```
[Unit]
Description=<description>

[Service]
Restart=on-failure
RestartSec=60s
Type=simple
User=<username>
Group=<group>
ExecStart=<here is your command>
Restart=always

[Install]
WantedBy=multi-user.target
```

* TODO
```
systemctl daemon-reload
```
