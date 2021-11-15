# Routeros

## Allow remote winbox connection

```
/ip firewall filter add action=accept chain=input disabled=no dst-port=8291 protocol=tcp
```