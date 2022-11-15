# Proxmox VE(PVE)

## 設定 VM 自動開機

![](https://i.imgur.com/UnBtDRV.png)

- In CLI

	```linenums="1"
	qm set $VMID --onboot 1
	```

## Share storage

1. 建立 NAS VM e.g. TrueNAS 並挑一個協議分享 e.g. NFS/CIFS
2. Datacenter > Storage > Add

* 權限設定要對: 如果是 TrueNAS & NFS 要將 pool 的 perm 設成建立的 user/group 和 NFS 的 mapalluser/mapallgroup 設成剛剛的 user/group

![](https://i.imgur.com/sK5sCXq.png)

<https://www.youtube.com/watch?v=eZXXa7ujoks>

## Others

- xterm.js
	- https://www.pigo.idv.tw/archives/3261
