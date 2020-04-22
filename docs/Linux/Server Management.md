# User

* Add a user

```bash
$ sudo adduser <username>
```

* Add a user to groups

```bash
$ sudo usermod -a -G group1,group2 user
```

# Misc

* Change the hostname

```bash
sudo hostname new-server-name-here
# Also edit /etc/hostname and /etc/hosts
# OR hostnamectl set-hostname new-server-name-here
```
