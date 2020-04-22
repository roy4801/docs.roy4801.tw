# SQL

## Privilege

* Create user

```sql
CREATE USER 'user'@'host' IDENTIFIED BY 'pass';
```

* Grant privileges
    * `ALL PRIVILEGES`
    * `CREATE`
    * `DROP`
    * `DELETE`
    * `INSERT`
    * `SELECT`
    * `UPDATE`

```sql
GRANT p1,p2,... ON database.table TO 'user'@'localhost';
# *.*
FLUSH PRIVILEGES;
```

* Delete a user

```sql
DROP USER 'user'@'localhost'
```

## Reference

<https://stackoverflow.com/questions/8369253/grant-user-access-to-limited-number-of-tables-in-mysql>
<https://stackoverflow.com/questions/8369253/grant-user-access-to-limited-number-of-tables-in-mysql>
