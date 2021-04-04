# ip

* set ip addr and gateway
```
ip addr add <ip>/24 dev ens160
route add default gw <gateway>
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
