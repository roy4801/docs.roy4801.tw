# PHP laravel
### Ubuntu
```bash
# apache
sudo apt install php7.2

# nginx
sudo apt install php7.2-fpm

# Install modules
sudo apt install php7.2-cli php7.2-xml php7.2-mysql php7.2-mbstring php7.2-xdebug

# Install composer to current dir
#https://getcomposer.org/doc/00-intro.md#downloading-the-composer-executable
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --filename=composer
php -r "unlink('composer-setup.php');"
# move composer to global
sudo mv composer /usr/local/bin/

# New project
composer create-project laravel/laravel example-app

# Serve
php artisan serve --host=0.0.0.0
```

* Install laravel globally
```bash
composer global require laravel/installer
```

### CentOS

* Install `nginx`
```bash
sudo yum install nginx

sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --reload
```

* Install PHP
```bash
sudo yum install epel-release
sudo yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum install yum-utils
sudo yum-config-manager --enable remi-php72
sudo yum update
sudo yum install php72 php72-php-fpm php72-php-gd php72-php-json php72-php-mbstring php72-php-mysqlnd php72-php-xml php72-php-xmlrpc php72-php-opcache php7.2-xdebug
```

<https://www.cyberciti.biz/faq/how-to-install-php-7-2-on-centos-7-rhel-7/></br>
<https://www.cyberciti.biz/faq/how-to-install-and-use-nginx-on-centos-7-rhel-7/>

## Usage

* Create a empty project
```
# >= php 7.3.0
laravel new abc
composer require laravel/ui
php artisan ui [bootstrap, vue, react] --auth

# else

```

## Logs

* `/var/log/php-fpm/www-error.log`

## Reference

<https://getcomposer.org/download/>
<https://www.tecmint.com/install-different-php-versions-in-ubuntu/>

