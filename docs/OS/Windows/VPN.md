# VPN

## Remove default route and add only subnet routes

### Remove default route through the VPN
- Run `ncpa.cpl` and right-click on the VPN you want to edit and select "Properties"
- On tab "Networking", select "TCP/IPv4" and click "Properties"
- Click "Advanced"
- Uncheck the "Use default gateway on remote network"

![](https://i.imgur.com/mlyxHwK.png)

### Add only subnet

```cmd
route add <IP> mask <MASK> <GATEWAY> [metric X] [if x]
```

## References

How to route only certain IP Addresses to your VPN in Windows
Version 0.51
<http://bootstrike.com/Articles/Win7Routing/>

How can I make the Windows VPN route selective traffic (by destination network)?
<https://superuser.com/questions/12022/how-can-i-make-the-windows-vpn-route-selective-traffic-by-destination-network>
