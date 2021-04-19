# Elasticsearch

```bash
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.2.1-linux-x86_64.tar.gz
tar xzvf ./elasticsearch-7.2.1-linux-x86_64.tar.gz
sudo mv elasticsearch-7.2.1 /usr/local/elasticsearch
sudo adduser elastic
sudo chown elastic:elastic -R /usr/local/elasticsearch/
cd /usr/local/elasticsearch
```

# Kibana

```bash
wget https://artifacts.elastic.co/downloads/kibana/kibana-7.2.1-linux-x86_64.tar.gz
tar xzvf ./kibana-7.2.1-linux-x86_64.tar.gz
sudo mv kibana-7.2.1-linux-x86_64 /usr/local/kibana
```
