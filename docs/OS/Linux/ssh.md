# ssh

* Generate the ssh key

```bash
$ mkdir -p ~/.ssh && chmod 700 ~/.ssh   # Create the .ssh directory
$ ssh-keygen  # Creates id_rsa* in ~/.ssh

# With comment & path
$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com" -f $HOME/.ssh/id_rsa
```

* Copy the ssh public key to server

```bash
$ ssh-copy-id USER@HOST
OR
$ ssh USER@HOST 'mkdir -p ~/.ssh;chmod 700 ~/.ssh;cat >> ~/.ssh/authorized_keys' < ~/.ssh/id_rsa.pub
```

* ssh-copy-id on windows

```bash
type %userprofile%\.ssh\id_rsa.pub | ssh <host> "cat >> .ssh/authorized_keys"
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
  - `-C` Compress

```bash
ssh -gfND 8080 username@<your host>
```

> TODO: autossh

# Windows sftp

- Setting > Apps > Optional features > Add an optional feature > OpenSSH Server

- Powershell Run as administrator

```powershell
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
```

# References

<https://kb.iu.edu/d/aews>
<https://blog.gtwang.org/linux/linux-ssh-public-key-authentication/>
<https://askubuntu.com/questions/346857/how-do-i-force-ssh-to-only-allow-users-with-a-key-to-log-in>

Reverse SSH Tunnel 反向打洞實錄<br>
<https://fred-zone.blogspot.com/2010/08/reverse-ssh-tunnel.html>

SSH Tunnel 通道打造加密 Proxy，透過外部 Linux 伺服器上網<br>
<https://blog.gtwang.org/linux/ssh-tunnel-socks-proxy-forwarding-tutorial/>

<https://berglas.github.io/dest/articles/2020/7/note_SFTP_setting_1.html>

<https://winscp.net/eng/docs/guide_windows_openssh_server>
