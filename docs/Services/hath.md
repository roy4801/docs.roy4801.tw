# H@H

Hello, Gentleman

## Download client

```
$ wget https://github.com/james58899/hath-rust/releases/download/v$(curl https://api.github.com/repos/james58899/hath-rust/releases | jq -r '.[0].name')/hath-rust-x86_64-unknown-linux-gnu -O hath
```

## Usage

- Start the client
```
hath --cache-dir /mnt/hath/cache --data-dir /mnt/hath/data --log-dir /mnt/hath/log --temp-dir tmp --download-dir /mnt/hath-download
```

- Mount download storage
	- 如果是 PVE 的 lxc 記得開啟 nfs 選項，並重啟 container
```bash
mount -t nfs 192.168.x.y:/mnt/pool0/hath /mnt/hath-download
# persistent
echo "192.168.x.y:/mnt/pool0/hath   /mnt/hath-download   nfs   defaults      0 0" >> /etc/fstab
```

- `systemd` service: `hath.service`
```
[Unit]
Description=H@H service
After=local-fs.target remote-fs.target network.target

[Service]
User=root
WorkingDirectory=/root/hath
SuccessExitStatus=143
ExecStart=/root/hath/hath --cache-dir /mnt/hath/cache --data-dir /mnt/hath/data --log-dir /mnt/hath/log --temp-dir /mnt/hath/tmp --download-dir /mnt/hath-download
Restart=on-abort

[Install]
WantedBy=multi-user.target
```

## Reference

<https://github.com/Yukariin/hath-scripts/blob/master/systemd.service>
<https://github.com/james58899/hath-rust>
