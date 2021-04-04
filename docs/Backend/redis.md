---
title: redis
date: 2020-04-23
---
# Redis

## Ubuntu

* Install

```bash
sudo apt install redis-server
sudo systemctl enable redis-server.service
# Restart
sudo systemctl restart redis-server.service
```

* Config
    * `sudo vim /etc/redis/redis.conf`

```
maxmemory 256mb
maxmemory-policy allkeys-lru
```

## Reference

<https://tecadmin.net/install-redis-ubuntu/>