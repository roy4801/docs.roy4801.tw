# Routeros

## Allow remote winbox connection

```
/ip firewall filter add action=accept chain=input disabled=no dst-port=8291 protocol=tcp
```

## Enabling HTTPS on MikroTik

- Create certificates

```linenums="1"
/certificate
add name=root-cert common-name=MyRouter days-valid=3650 key-usage=key-cert-sign,crl-sign
sign root-cert
add name=https-cert common-name=MyRouter days-valid=3650
sign ca=root-cert https-cert
```

- Enable `www-ssl` service and disable `www` service

```linenums="1"
/ip service
set www-ssl certificate=https-cert disabled=no
set www disabled=yes
```

## DNS Server

![](https://i.imgur.com/Pei98qs.png)

- Redirect all LAN DNS requests to the router

```linenums="1"
ip firewall nat add chain=dstnat action=redirect to-ports=53 protocol=udp dst-port=53 to-address=192.168.88.1 comment="DIRECT ALL DNS REQUESTS TO MIKROTIK INTERNAL DNS SERVER."
```

- Forbid all Remove DNS request

```linenums="1"
ip firewall filter.

add action=drop chain=input dst-port=53 protocol=udp
add action=drop chain=input dst-port=53 protocol=tcp
```

- Set static DNS record

![](https://i.imgur.com/gGYhxy2.png)

## Setting DoH

- Download Root CAs (In ROS terminal)
```linenums="1"
/tool fetch url=https://curl.se/ca/cacert.pem
/certificate import file-name=cacert.pem passphrase=""
```

- Remove existing DNS setting
- Add a static DNS entry for DoH hostname
	- e.g. `cloudflare-dns.com -> 1.1.1.1`
- Add `use DoH Server` and check `Verify DoH Certificate`
	- e.g. `https://cloudflare-dns.com/dns-query`
- Checking DNS status: https://1.1.1.1/help

- References
	- MikroTik Tutorial: How to enable DNS over HTTPS (DoH): <https://jcutrer.com/howto/networking/mikrotik/mikrotik-dns-over-https>
	- [教學] Mikrotik 如何使用 DNS over HTTPS ( DoH ): <https://mahirmax.blogspot.com/2020/08/mikrotik-dns-over-https-doh.html?m=0>
	- HTTPS 什麼是根憑證 root certificate: <https://matthung0807.blogspot.com/2021/03/https-what-is-root-certificate.html>
