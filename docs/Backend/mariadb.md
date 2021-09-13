# MariaDB

## Installation

### Ubuntu

```bash
sudo apt install mariadb-server
```

### CentOS

```bash
curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
sudo yum install MariaDB-client MariaDB-shared
```

---

* Interactive secure setting
```bash
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