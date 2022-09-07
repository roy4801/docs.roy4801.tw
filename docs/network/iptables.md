# iptables

## NAT

- `eth0` wan
- `eth1` lan

```bash
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo iptables -A FORWARD -i eth1 -j ACCEPT
sudo iptables -A FORWARD -o eth1 -j ACCEPT
```

- Port forwarding

```bash
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT \
      --to 172.31.0.23:80
```

## Usage

- Detailed info
	- `-n` numeric output
	- `-v` verbose
	- `-L` list

```bash
sudo iptables -nvL [-t table]
```

- Flush
	- `-t` table
		- `filter`: INPUT, FORWARD, OUTPUT
		- `nat`: PREROUTING, OUTPUT, POSTROUTING
		- `mangle` ...
		- `raw` ...
		- `security` ...

```bash
sudo iptables -t nat -F
```

## Persistent

- Write iptable configs in `/etc/network/interfaces`

```
source /etc/network/interfaces.d/*

auto lo
iface lo inet loopback

allow-hotplug ens18
auto ens18
iface ens18 inet static
address 1.2.3.4/24
gateway 1.2.3.1
dns-nameservers 1.1.1.1

auto ens19
iface ens19 inet static
address 10.0.0.254
netmask 255.255.255.0
post-up iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o ens18 -j MASQUERADE
```

- Use `iptables-persistent`

## References

https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/4/html/security_guide/s1-firewall-ipt-fwd
https://web.mit.edu/rhel-doc/4/RH-DOCS/rhel-sg-zh_tw-4/s1-firewall-ipt-fwd.html
https://www.cyberciti.biz/faq/howto-iptables-show-nat-rules/
https://magiclen.org/ubuntu-server-iptables-save-permanently/
https://linuxconfig.org/how-to-make-iptables-rules-persistent-after-reboot-on-linux
https://blog.longwin.com.tw/2016/11/debian-linux-iptable-save-restore-auto-start-2016/
http://onlinetest3-7.slhs.tp.edu.tw/webdoc/net-b/net-s3-router.html
