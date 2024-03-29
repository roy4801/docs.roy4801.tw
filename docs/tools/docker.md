# docker

## Images

```bash
# remove dangling images
docker rmi -f $(docker images -f dangling=true -q)
# remove dangling volumes
docker volume rm $(docker volume ls -qf dangling=true)
```

## Installation

- Script

```bash linenums="1"
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
```

### Ubuntu

```bash
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
```

### CentOS

```bash
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```

### docker-compose

```bash
# Need jq
sudo curl -L "https://github.com/docker/compose/releases/download/$(curl https://api.github.com/repos/docker/compose/releases | jq -r '.[0].name')/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

## Get container IP

```bash
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' IP
```
