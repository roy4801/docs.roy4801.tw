# ssh

* Generate the ssh key

```bash
$ mkdir -p ~/.ssh && chmod 700 ~/.ssh   # Create the .ssh directory
$ ssh-keygen  # Creates id_rsa* in ~/.ssh
```

* Copy the ssh public key to server

```bash
$ ssh-copy-id USER@HOST
OR
$ ssh USER@HOST 'mkdir -p ~/.ssh;chmod 700 ~/.ssh;cat >> ~/.ssh/authorized_keys' < ~/.ssh/id_rsa.pub
```

# sshd

* Disable password authentication
  * in `/etc/ssh/sshd_config`

```
PasswordAuthentication no
PubkeyAuthentication yes
```

And restart the sshd service

```bash
$ sudo service sshd restart
$ sudo systemctl restart sshd  # OR
$ sudo /etc/init.d/ssh restart # OR
```

# Tunnel

* reverse tunnel

```bash
# On target
ssh -NfR 12345:localhost:22 username@myhost
# On myhost
ssh localhost -p 12345
```

* SOCK5 proxy

```bash
ssh -gfND 8080 username@<your host>
```

> TODO: autossh

# References

<https://kb.iu.edu/d/aews>
<https://blog.gtwang.org/linux/linux-ssh-public-key-authentication/>
<https://askubuntu.com/questions/346857/how-do-i-force-ssh-to-only-allow-users-with-a-key-to-log-in>

Reverse SSH Tunnel 反向打洞實錄<br>
<https://fred-zone.blogspot.com/2010/08/reverse-ssh-tunnel.html>

SSH Tunnel 通道打造加密 Proxy，透過外部 Linux 伺服器上網<br>
<https://blog.gtwang.org/linux/ssh-tunnel-socks-proxy-forwarding-tutorial/>
