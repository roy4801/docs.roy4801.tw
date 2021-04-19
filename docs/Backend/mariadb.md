# MariaDB

## Installation

```bash=
sudo apt install mariadb-server
```

* Interactive secure setting
```bash=
sudo mysql_secure_installation
```

* Add user with all privileges
```
GRANT ALL ON *.* TO 'admin'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;
FLUSH PRIVILEGES;
exit;
```

* Test
```
sudo mysqladmin version
```