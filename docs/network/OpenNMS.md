# OpenNMS

## Installation

### CentOS7

<https://www.tecmint.com/install-opennms-network-monitoring-in-centos-rhel/>

```bash linenums="1"
yum install java-11-openjdk
export JAVA_HOME=/usr/lib/jvm/XXX
yum -y install https://yum.opennms.org/repofiles/opennms-repo-stable-rhel7.noarch.rpm
rpm --import https://yum.opennms.org/OPENNMS-GPG-KEY
yum -y install opennms

# Install PostgresSQL > 10
sudo /usr/pgsql-10/bin/postgresql-10-setup initdb
su - postgres
createuser -P opennms # Enter password
createdb -O opennms opennms
psql -c "ALTER USER postgres WITH PASSWORD 'xu0650@yvmp4';"
exit

vim /var/lib/pgsql/10/data/pg_hba.conf
# Editing method to md5
# host    all             all             127.0.0.1/32            md5
# host    all             all             ::1/128                 md5
systemctl reload postgresql

vim /opt/opennms/etc/opennms-datasources.xml
# <jdbc-data-source name="opennms"
#                     database-name="opennms"
#                     class-name="org.postgresql.Driver"
#                     url="jdbc:postgresql://localhost:5432/opennms"
#                     user-name="opennms"
#                     password="your-passwd-here" />

# <jdbc-data-source name="opennms-admin"
#                     database-name="template1"
#                     class-name="org.postgresql.Driver"
#                     url="jdbc:postgresql://localhost:5432/template1"
#                     user-name="postgres"
#                     password="your-db-admin-pass-here" />

/opt/opennms/bin/runjava -s
/opt/opennms/bin/install -dis
systemctl start opennms
systemctl enable opennms
systemctl status 

firewall-cmd --permanent --add-port=8980/tcp
firewall-cmd --reload
```

- PostgreSQL
	- https://blog.gtwang.org/linux/centos-linux-install-postgresql-database-tutorial/

```bash linenums="1"
wget https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
sudo yum install pgdg-redhat-repo-latest.noarch.rpm epel-release
sudo yum install postgresql10-server postgresql10-contrib -y
sudo /usr/pgsql-10/bin/postgresql-10-setup initdb
systemctl start postgresql-10
systemctl enable postgresql-10
```
