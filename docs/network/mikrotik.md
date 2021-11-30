# Routeros

## Allow remote winbox connection

```
/ip firewall filter add action=accept chain=input disabled=no dst-port=8291 protocol=tcp
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
