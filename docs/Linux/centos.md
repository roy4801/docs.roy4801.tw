# CentOS

## yum

* List installed packages
```
sudo yum list installed
```

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

## Setting up the network

```
cd /etc/sysconfig/network-scripts/
sudo vi ifcfg-eXX

IPADDR, PREFIX, GATEWAY, DNS1, DNS2

sudo ifdown ifcfg-eXX
sudo ifup ifcfg-eXX
```

## Keys

```
sudo bash -c "curl https://www.centos.org/keys/RPM-GPG-KEY-CentOS-Official > /etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial"
sudo yum update -y
```

