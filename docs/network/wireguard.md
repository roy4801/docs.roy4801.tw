# Wireguard

## Install

* Ubuntu 16.04
```
# printf "\n" | add-apt-repository ppa:wireguard/wireguard
# apt update && apt instll wireguard -y
```
* Activate wireguard
```
# modprobe wireguard
# lsmod | grep wireguard # check whether the module is loaded
```

* macos
```
$ brew install wireguard
```

## Setting up
### Server

* Generate keys
```
$ cd /etc/wireguard
$ umask 077
$ wg genkey | sudo tee privatekey | wg pubkey | sudo tee publickey
```

* Configureation (`/etc/wireguard/wg0.conf`)
```
[Interface]
PrivateKey = <your server private key here>
Address = 10.10.0.1/24
#Address = fd86:ea04:1111::1/64
SaveConfig = true
PostUp = iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o ens3 -j MASQUERADE; ip6tables -A FORWARD -i wg0 -j ACCEPT; ip6tables -t nat -A POSTROUTING -o ens3 -j MASQUERADE
PostDown = iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o ens3 -j MASQUERADE; ip6tables -D FORWARD -i wg0 -j ACCEPT; ip6tables -t nat -D POSTROUTING -o ens3 -j MASQUERADE
ListenPort = 51820
DNS = 1.1.1.1
MTU = 1420
```

- iptables
```
iptables -A FORWARD -i wg0 -j ACCEPT && iptables -A FORWARD -o wg0 -j ACCEPT && iptables -t nat -A POSTROUTING -o enp1s0 -j MASQUERADE
iptables -D FORWARD -i wg0 -j ACCEPT && iptables -D FORWARD -o wg0 -j ACCEPT && iptables -t nat -D POSTROUTING -o enp1s0 -j MASQUERADE
```

!!!info
	The network interface must set to the one which connects to the internet<br>
	Use `ip addr` to check.

* peers(client) @ `/etc/wireguard/wg0.conf`
```
[Peers]
PublicKey = <Ur client pub key here>
AllowedIPs = 10.10.0.2/32
```

or use `wg set`
```
wg set wg0 peer <client-public-key> allowed-ips 10.10.0.2/32,fd86:ea04:1111::2/128
```

* Turn up
```
$ wg-quick up wg0    # Turn up
$ wg-quick down wg0  # Turn down
```

* Check status
```
$ wg
```

#### Turn ipv4 forward

- Temporary
```
# echo 1 > /proc/sys/net/ipv4/ip_forward
# or
# sysctl -w net.ipv4.ip_forward=1
```

- You need to edit `/etc/sysctl.conf`
	- Change `net.ipv4.ip_forward` from `0` to `1`
```
# sed -i '/net.ipv4.ip_forward/ s/\(.*= \).*/\11/' /etc/sysctl.conf
```

#### Auto start on linux

- Start

```bash
sudo systemctl enable wg-quick@wg0.service
sudo systemctl daemon-reload
sudo systemctl start wg-quick@wg0
```

- Stop

```bash
sudo systemctl stop wg-quick@wg0
sudo systemctl disable wg-quick@wg0.service
sudo rm -i /etc/systemd/system/wg-quick@wg0*
sudo systemctl daemon-reload
sudo systemctl reset-failed
```

!!!warning
	Q: `/usr/bin/wg-quick: line 31: resolvconf: command not found`
	A: `ln -s /usr/bin/resolvectl /usr/local/bin/resolvconf`

### Client

#### Linux
```
[Interface]
Address = 10.10.0.2/32
Address = fd86:ea04:1111::2/128
SaveConfig = true
PrivateKey = <your client private key here>
DNS = 1.1.1.1

[Peer]
PublicKey = <your server public key here>
Endpoint = <your server public ip>:51820
AllowedIPs = 0.0.0.0/0, ::/0
```

perm : `$ chmod 600 /etc/wireguard/wg0.conf`

#### macos

![](https://i.imgur.com/aUnpsKs.png)

![](https://i.imgur.com/lgIGhUz.png)

## wireguard-ui

A wireguard web interface: https://github.com/ngoduykhanh/wireguard-ui

```bash
git clone https://github.com/ngoduykhanh/wireguard-ui.git
cd wireguard-ui && docker-compose up
```
