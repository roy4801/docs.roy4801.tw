# User

* Add a user

```bash
$ sudo adduser <username>
```

* Add a user to groups

```bash
$ sudo usermod -a -G group1,group2 user
```

- Add a user to sudoer in Debian

```bash
$ su -
# usermod -a -G sudo <username>

sudo -l -U <username> # check if the user has sudo
```

# Misc

* Change the hostname

```bash
sudo hostname new-server-name-here
# Also edit /etc/hostname and /etc/hosts
# OR hostnamectl set-hostname new-server-name-here
```
