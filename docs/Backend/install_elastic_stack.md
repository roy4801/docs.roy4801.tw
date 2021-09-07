# Elastic Stack

# Elasticsearch

- Utilities
	- `/usr/share/elasticsearch/bin/`
- Config path
	- `/etc/elasticsearch`
- Log
	- `/var/log/elasticsearch/`

```bash
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.2.1-linux-x86_64.tar.gz
tar xzvf ./elasticsearch-7.2.1-linux-x86_64.tar.gz
sudo mv elasticsearch-7.2.1 /usr/local/elasticsearch
sudo adduser elastic
sudo chown elastic:elastic -R /usr/local/elasticsearch/
cd /usr/local/elasticsearch
```

## Ubuntu

<https://www.elastic.co/guide/en/elasticsearch/reference/current/deb.html>

```bash
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update && sudo apt-get install elasticsearch
sudo systemctl start elasticsearch
curl "http://localhost:9200" # Test
```

## Settings

`sudo vim /etc/elasticsearch/elasticsearch.yml`

```yml
# 綁定特定 IP
# network.bind_host: 192.168.56.101
# 綁定多個 IP
# network.host: ["192.168.56.101", "127.0.0.1"]
# 綁定所有 IP
network.bind_host: 0.0.0.0

# 綁定 Port，預設其實就是 9200
http.port: 9200
```

### Security
- xpack: es version `>= 6.3.0`

```bash
sudo /usr/share/elasticsearch/bin/elasticsearch-setup-passwords interactive
# Setting all passwords
# ...
sudo vim /etc/kibana/kibana.yml
	elasticsearch.username: "kibana_system"
	elasticsearch.password: "your password"
# Restart the elasticsearch
```

## Reference

https://ithelp.ithome.com.tw/articles/10215214

# Kibana

<https://www.elastic.co/guide/en/kibana/current/deb.html>

```bash
wget https://artifacts.elastic.co/downloads/kibana/kibana-7.2.1-linux-x86_64.tar.gz
tar xzvf ./kibana-7.2.1-linux-x86_64.tar.gz
sudo mv kibana-7.2.1-linux-x86_64 /usr/local/kibana
```

## Ubuntu

```bash
sudo apt-get install kibana
sudo systemctl start kibana
```

- Config `/etc/kibana/kibana.yml`

# Filebeat

## Installation

```bash linenums="1"
sudo apt install filebeat
```

## Config

- Download Example
	- <https://raw.githubusercontent.com/elastic/beats/v7.13.2/filebeat/filebeat.reference.yml>

- Remember to change host:ip, username, and password if changed