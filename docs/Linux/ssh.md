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

# References

<https://kb.iu.edu/d/aews>
<https://blog.gtwang.org/linux/linux-ssh-public-key-authentication/>
<https://askubuntu.com/questions/346857/how-do-i-force-ssh-to-only-allow-users-with-a-key-to-log-in>
