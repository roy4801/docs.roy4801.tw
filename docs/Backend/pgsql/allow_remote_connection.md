# Allow remote connection - PostgreSQL

- Edit `/var/lib/pgsql/12/data/postgresql.conf`

```
listen_addresses = '*'
```

- Edit `/var/lib/pgsql/12/data/pg_hba.conf` to add the following lines for allowing remote connection

```
host    all             all              0.0.0.0/0                       md5
host    all             all              ::/0                            md5
```

- Optional: Add firewall rule and restart it

```bash
# CentOS
firewall-cmd --add-service=postgresql --permanent
firewall-cmd --reload
```

## References

Configure PostgreSQL to allow remote connection<br />
<https://www.bigbinary.com/blog/configure-postgresql-to-allow-remote-connection>

“psql :could not connect to server: no route to host” – How we fix it<br />
<https://bobcares.com/blog/psql-could-not-connect-to-server-no-route-to-host/>
