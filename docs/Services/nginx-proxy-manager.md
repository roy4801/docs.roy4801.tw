# Nginx Proxy Manager

Nginx Proxy Manager 是一個易於設定反向代理，擁有 webgui 介面方便設定，可以方便的管理 SSL 證書和替路由加上 https

## Installation

官方有 docker image 並且有提供 [docker-compose.yml](https://nginxproxymanager.com/setup/#running-the-app) 方便私人架設使用

```docker-compose
version: '3'
services:
  app:
    image: 'jc21/nginx-proxy-manager:latest'
    restart: unless-stopped
    ports:
      - '80:80'
      - '81:81'
      - '443:443'
    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt
    network_mode: "host"
```

## Usage

1. 去 DNS 設定想要的子域名指向 NPM 所執行的 IP
2. 在 NPM 新增 Proxy Hosts 並設定域名以及 IP 和 port
	- 選用: SSL
3. Done.

!!!info
	使用 bridge mode 可以指向其他 docker continer 的 ip

!!!warning
	如果要指向 localhost 則需要使用 `network_mode: "host"` 使得 docker container 直接使用 host 網路，預設是 bridge 網路(可用 `docker network ls`)查看。

## References

https://nginxproxymanager.com/

https://github.com/NginxProxyManager/nginx-proxy-manager

https://www.sio.moe/2021/12/18/computer/Docker-Container/Use-Docker-to-install-Nginx-ProxyManager-for-SSL-reverse-proxy/
