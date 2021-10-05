# ip

## `ip`

* Setup the ip addr and gateway

```bash linenums="1"
ip addr add <ip>/24 dev ens160
route add default gw <gateway>
```

## `/etc/network/interfaces`

```
vim /etc/network/interfaces

auto lo
iface lo inet loopback

auto ensX
iface ensX inet static
address <IP>
netmask 255.255.255.0
gateway <gateway>
```

### NetworkManager

```
nmcli
```

## netplan

* Config file @ `/etc/netplan`

```
network:
  ethernets:
    ens160:
      addresses:
      - 140.136.149.93/24
      gateway4: 140.136.149.254
      nameservers:
        addresses:
        - 1.1.1.1
        - 8.8.8.8
  version: 2
```

* Test the config

```
sudo netplan try
```

* Apply the config

```
sudo netplan apply
```

### Ref

<https://netplan.io/>

<https://netplan.io/examples/>

Ubuntu Linux 18.04 �O���o�B�W· IP λַ�̌W
<https://blog.gtwang.org/linux/ubuntu-linux-1804-configure-network-static-ip-address-tutorial/>

Ubuntu �W·�O�� - �̶� IP
<http://note.drx.tw/2008/02/ubuntu-ip.html>

NetworkManager - ArchWiki
<https://wiki.archlinux.org/title/NetworkManager>

Ubuntu NetworkManager ʹ��Ҫ�
<https://www.rocksaying.tw/archives/11777065.html>

ubuntu ʹ��ifupdown ���и߼���������
<https://www.cnblogs.com/yasmi/p/4843348.html>

debian network docs
<https://www.debian.org/doc/manuals/debian-reference/ch05.zh-tw.html>
