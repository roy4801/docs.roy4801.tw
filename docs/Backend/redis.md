---
title: redis
date: 2020-04-23
---
# Redis
## Installation
### Ubuntu

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

### CentOS7

```bash
# install
sudo yum -y install epel-release
sudo yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum -y --enablerepo=remi,remi-test install redis

# enable redis as service
sudo systemctl daemon-reload
sudo systemctl enable redis.service

firewall-cmd --permanent --add-port=6379/tcp
firewall-cmd --reload

sudo systemctl start redis
```

## CLI

```bash
# ping redis
redis-cli ping

# get version
redis-server -v

#效能測試 http://redis.io/topics/benchmarks
redis-benchmark -q -n 100000
```

## Reference

<https://tecadmin.net/install-redis-ubuntu/>

<https://dotblogs.com.tw/supershowwei/2016/02/01/144251>

<https://xyz.cinc.biz/2015/09/centos7-redis-php.html>