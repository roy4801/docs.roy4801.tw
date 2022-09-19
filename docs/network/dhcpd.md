# isc-dhcp-server

- config: `/etc/dhcp/dhcpd.conf`

```bash lib="1"
sudo systemctl restart isc-dhcp-server
```

- Setting up dhcp service

```
subnet 10.0.0.0 netmask 255.255.255.0 {
  range 10.0.0.1 10.0.0.253;
  option routers 10.0.0.254;
  option domain-name-servers 10.0.0.254, 1.1.1.1, 8.8.8.8;
}

# static
host server2 {
    hardware ethernet 08:00:27:39:e2:72;                                                                                                                                          
    fixed-address 192.168.57.104;
}
```

- Group

```
group {
    option domain-name-servers 192.168.56.103;
      
    host server2 {
        hardware ethernet 08:00:27:39:e2:72;                                                                                                                                          
        fixed-address 192.168.57.104;
    }

    host server3 {
        hardware ethernet 08:00:27:39:e3:56;                                                                                                                                          
        fixed-address 192.168.57.105;
    }

    subnet 192.168.57.0 netmask 255.255.255.0 {
        range 192.168.57.150 192.168.57.160;
    }
}
```

## References

https://magiclen.org/ubuntu-server-dhcp/
