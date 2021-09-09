# Redirect port

```
netsh advfirewall firewall add rule name="test_arduino_8888" protocol=TCP dir=in localip=0.0.0.0 localport=8888 action=allow

netsh interface portproxy add v4tov4 listenport=8888 listenaddress=0.0.0.0 connectport=80 connectaddress=192.168.68.107

netsh interface portproxy reset
```

## Ref

http://woshub.com/port-forwarding-in-windows/