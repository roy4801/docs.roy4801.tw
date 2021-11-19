# LibreNMS

## Installation

### Ubuntu 20.04

```bash linenums="1"
# Install dependencies
sudo apt install software-properties-common
sudo add-apt-repository universe
sudo apt update
sudo apt install acl curl composer fping git graphviz imagemagick mariadb-client mariadb-server mtr-tiny nginx-full nmap php7.4-cli php7.4-curl php7.4-fpm php7.4-gd php7.4-gmp php7.4-json php7.4-mbstring php7.4-mysql php7.4-snmp php7.4-xml php7.4-zip rrdtool snmp snmpd whois unzip python3-pip python3-pymysql python3-dotenv python3-redis python3-setuptools python3-systemd

# Add user & password
sudo useradd librenms -d /opt/librenms -M -r -s "$(which bash)"
sudo passwd librenms

# Download librenms & set permissions
cd /opt && git clone https://github.com/librenms/librenms.git
sudo chown -R librenms:librenms /opt/librenms && sudo chmod 771 /opt/librenms
sudo setfacl -d -m g::rwx /opt/librenms/rrd /opt/librenms/logs /opt/librenms/bootstrap/cache/ /opt/librenms/storage/
sudo setfacl -R -m g::rwx /opt/librenms/rrd /opt/librenms/logs /opt/librenms/bootstrap/cache/ /opt/librenms/storage/

# Install PHP deps
su - librenms
./scripts/composer_wrapper.php install --no-dev
exit

# Set date.timezone = Asia/Taipei
sudo vim /etc/php/7.4/fpm/php.ini
sudo vim /etc/php/7.4/cli/php.ini
timedatectl set-timezone Asia/Taipei

# Configure MariaDB
sudo vim /etc/mysql/mariadb.conf.d/50-server.cnf
# Add these in [mysqld]
# 	innodb_file_per_table=1
# 	lower_case_table_names=0
sudo systemctl enable mariadb && sudo systemctl restart mariadb
sudo mysql -u root << EOF
CREATE DATABASE librenms CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'librenms'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON librenms.* TO 'librenms'@'localhost';
FLUSH PRIVILEGES;
exit
EOF

# Configure PHP-FPM
sudo cp /etc/php/7.4/fpm/pool.d/www.conf /etc/php/7.4/fpm/pool.d/librenms.conf
sudo vim /etc/php/7.4/fpm/pool.d/librenms.conf
# [www] -> [librenms]
# user = librenms
# group = librenms
# listen = /run/php-fpm-librenms.sock
 
# Configure Web Server
sudo vim /etc/nginx/conf.d/librenms.conf
# 
server {
 listen      80;
 server_name librenms.example.com; # REMEMBER TO CHANGE THIS
 root        /opt/librenms/html;
 index       index.php;

 charset utf-8;
 gzip on;
 gzip_types text/css application/javascript text/javascript application/x-javascript image/svg+xml text/plain text/xsd text/xsl text/xml image/x-icon;
 location / {
  try_files $uri $uri/ /index.php?$query_string;
 }
 location ~ [^/]\.php(/|$) {
  fastcgi_pass unix:/run/php-fpm-librenms.sock;
  fastcgi_split_path_info ^(.+\.php)(/.+)$;
  include fastcgi.conf;
 }
 location ~ /\.(?!well-known).* {
  deny all;
 }
}
#
sudo rm /etc/nginx/sites-enabled/default
sudo systemctl restart nginx && sudo systemctl restart php7.4-fpm

# Enable command completion
sudo ln -s /opt/librenms/lnms /usr/bin/lnms
sudo cp /opt/librenms/misc/lnms-completion.bash /etc/bash_completion.d/

# Install snmpd
sudo cp /opt/librenms/snmpd.conf.example /etc/snmp/snmpd.conf
sudo vim /etc/snmp/snmpd.conf # Edit RANDOMSTRINGGOESHERE -> community string
sudo curl -o /usr/bin/distro https://raw.githubusercontent.com/librenms/librenms-agent/master/snmp/distro
sudo chmod +x /usr/bin/distro
sudo systemctl enable snmpd && sudo systemctl restart snmpd

# Enable cron job
sudo cp /opt/librenms/librenms.nonroot.cron /etc/cron.d/librenms

# logrotate
sudo cp /opt/librenms/misc/librenms.logrotate /etc/logrotate.d/librenms
# Complete Go
```

- Debug

```bash linenums="1"
sudo su - librenms
./validate.php
```
