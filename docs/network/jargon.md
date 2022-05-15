# Networking Jargon

## Network Devices

- ATU-R (ADSL Tranceiver Unit Remote): 小烏龜
- VTU-R (VDSL Tranceiver Unit Remote): 電話線路加裝VDSL數據機(VTU-R)，藉由分頻技術使用戶可透過同一條電話線路同時撥接電話並享受高速上網，不會互相干擾。

## Fibre

- PON (Passive Optical Network): 無源光網絡
	- OLT (Optical Line Terminal): 光纖線路終端
	- ONT (Optical Network Terminal): 光纖網路終端
	- ONU (Optical Network Unit): 光纖網路單位
	- ODN (Optical Distribution Network): 光纖分配網路

```
OLT <--> Splitter <--> ONU/ONT
```

- Standards
	- ITU-T G.98x
		- APON -> BPON -> GPON -> XGPON
	- IEEE 802 EFM
		- EPON -> 10G-EPON

| Characteristics | EPON              | GPON              |
|-----------------|-------------------|-------------------|
| Speed           | 1.25Gbps/1.25Gbps | 2.48Gbps/1.24Gbps |

- Reference
	- <https://www.sysage.com.tw/news/technology/187>
	- <https://www.thinkbroadband.com/guides/fibre-fttc-ftth-broadband-guide>
	- <https://www.fiber-optic-solutions.com/epon-vs-gpon-a-practical-comparison.html>

- FTTx

| Characteristics | FTTCab                     | FTTC                       | FTTB                       | FTTH              |
|-----------------|----------------------------|----------------------------|----------------------------|-------------------|
| Position of ONU | 交換箱                     | 街角                       | 大樓                       | 家                |
| 接入介質        | 主幹: 光纖<br/>末端: 銅線or無線 | 主幹: 光纖<br/>末端: 銅線or無線 | 主幹: 光纖<br/>末端: 銅線or無線 | 全程光纖          |
| 光節點距離用戶  | 1~2km                      | 1~2km                      | 200m~1km                   | 幾米至幾十米      |
| Speed           | 25Mbps/1.8Mbps             | Best 100Mbps/25Mbps        | Best 100Mbps/100Mbps       | > 100Mbps/100Mbps |