# nextcloud

!!!info
	On `Ubuntu 20.04`, TODO: redis, php-fpm

- Install php, apache2, and mariadb

```bash linenums="1"
sudo apt update
sudo apt install apache2 mariadb-server libapache2-mod-php7.4
sudo apt install php7.4-gd php7.4-mysql php7.4-curl php7.4-mbstring php7.4-intl
sudo apt install php7.4-gmp php7.4-bcmath php-imagick php7.4-xml php7.4-zip
```

- Initialize the DB

```bash linenums="1"
sudo mysql -uroot -p <<<EOF
CREATE USER 'nextcloud'@'localhost' IDENTIFIED BY 'password';
CREATE DATABASE IF NOT EXISTS nextcloud CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextcloud'@'localhost';
FLUSH PRIVILEGES;
exit
EOF;
```

- Download nextcloud and install

```bash linenums="1"
cd /var/www
wget https://download.nextcloud.com/server/releases/nextcloud-23.0.0.zip \
 && unzip nextcloud-23.0.0.zip && rm nextcloud-23.0.0.zip
```

- Add apache2 conf: `/etc/apache2/sites-available/nextcloud.conf`
	- Remember to change the `ServerName`
	- Run `a2ensite nextcloud.conf` to enable

```linenums="1"
Alias /nextcloud "/var/www/nextcloud/"

<VirtualHost *:80>
  DocumentRoot /var/www/nextcloud/
  ServerName  your.server.com

  <Directory /var/www/nextcloud/>
    Require all granted
    AllowOverride All
    Options FollowSymLinks MultiViews

    <IfModule mod_dav.c>
      Dav off
    </IfModule>
  </Directory>
</VirtualHost>
```

- Enable some apache2 modules

```bash linenums="1"
sudo a2enmod rewrite
sudo a2enmod headers
sudo a2enmod env
sudo a2enmod dir
sudo a2enmod mime
sudo a2enmod ssl
sudo systemctl restart apache2
```

- Pretty urls
	- Add these line in `/var/www/nextcloud/config/config.php`
	- Run `sudo -u www-data php /var/www/nextcloud/occ maintenance:update:htaccess` to update
```linenums="1"
'overwrite.cli.url' => 'https://nextcloud.roy4801.tw/',
'htaccess.RewriteBase' => '/',
```

- Chown the permission to `www-data`
```bash linenums="1"
chown -R www-data:www-data /var/www/nextcloud/
```

- Install Certificate by `certbot`

```bash linenums="1"
sudo apt install python3-certbot-apache
sudo certbot --apache

sudo systemctl status certbot.timer # Checking the auto renew
```

- Add cron job
```bash linenums="1"
crontab -u www-data -e

*/5  *  *  *  *  php -f /var/www/nextcloud/cron.php
```

## Apps

!!!warning
	Remember to enable apps in Settings

- Preview Generator
```bash linenums="1"
cd /var/www/nextcloud/apps
git clone https://github.com/nextcloud/previewgenerator.git

crontab -u www-data -e
# */10 *  *  *  *  php /var/www/nextcloud/occ preview:pre-generate
```

## HEIC

<https://eplt.medium.com/5-minutes-to-install-imagemagick-with-heic-support-on-ubuntu-18-04-digitalocean-fe2d09dcef1>

<https://gist.github.com/ishad0w/788555191c7037e249a439542c53e170>

<https://github.com/nextcloud/photos/issues/498>

<https://github.com/major-mayer/imageconverter/>

## References

<https://docs.nextcloud.com/server/latest/admin_manual/installation/example_ubuntu.html>

<https://docs.nextcloud.com/server/latest/admin_manual/installation/source_installation.html#apache-configuration-label>

<https://www.pigo.idv.tw/archives/832>

<https://stackoverflow.com/questions/55183514/symfony-4-an-exception-occurred-in-driver-could-not-find-driver>