# Setting

## User

```
USE mysql;
```

* Check users

```
MariaDB [mysql]> select user,host,plugin from user;
+--------------+-----------+-----------------------+
| user         | host      | plugin                |
+--------------+-----------+-----------------------+
| root         | localhost | unix_socket           |
| ....         | localhost |                       |
| xxx          | localhost |                       |
| ????         | localhost | mysql_native_password |
| ????         | %         | mysql_native_password |
+--------------+-----------+-----------------------+
```

* Create a user
```sql
CREATE USER 'username'@'localhost' IDENTIFIED BY 'password; # 本機
CREATE USER 'username'@'%' IDENTIFIED BY 'password; # 遠端
```

* Set plugin
	* `mysql_native_password`
	* `unix_socket`/`auth_socket`
	
```
UPDATE user SET plugin='plugin_name' WHERE user='user_name';
```

* Grant privileges [Ref](/sql/query/#privilege)
```sql
GRANT ALL PRIVILEGES ON *.* TO 'username'@'host';
FLUSH PRIVILEGES;
```

* Set password for a user

```sql
SET PASSWORD FOR 'user'@'host' = PASSWORD('pass'); # <= MySQL 5.7.5
ALTER USER 'user'@'host' IDENTIFIED BY 'pass';     # >= MySQL 5.7.6
```

```bash
mysqladmin -u user -p'old' password 'new'
```

## Allow remote access

* Comment `bind-address`
	* mysql
		* <= 5.5 `/etc/mysql/my.cnf`
		* \>= 5.6 `/etc/mysql/mysql.conf.d/mysqld.cnf`
	* mariadb: `/etc/mysql/mariadb.conf.d/50-server.cnf`

* Restart mysql service

```bash
sudo systemctl restart mysql
```

## Reference

解决 MySQL 的 ERROR 1698 (28000): Access denied for user 'root'@'localhost'<br>
<https://blog.csdn.net/jlu16/article/details/82809937>

[MySQL] 資料庫密碼修改處理 – MySQL Password Change<br>
<https://code.yidas.com/mysql-password-change/>

MySQL 允許外部連入<br>
<https://contemplator.github.io/blog/2018/06/06/Mysql-%E5%85%81%E8%A8%B1%E5%A4%96%E9%83%A8%E9%80%A3%E5%85%A5/>

<http://itman.in/en/mysql-add-user-for-remote-access/>
