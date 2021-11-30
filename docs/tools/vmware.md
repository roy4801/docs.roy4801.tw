# vmware

## workstation

- Mount share folder in Linux guest

```bash linenums="1"
mount -t vmhgfs .host:/foo/bar /var/lib/bar
```

- `/etc/fstab`

```bash linenums="1"
.host:/XXX /home/roy4801/XXX fuse.vmhgfs-fuse allow_other,uid=1000,gid=1000   0       0
```

## References

<https://docs.vmware.com/en/VMware-Workstation-Pro/16.0/com.vmware.ws.using.doc/GUID-AB5C80FE-9B8A-4899-8186-3DB8201B1758.html>
