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
