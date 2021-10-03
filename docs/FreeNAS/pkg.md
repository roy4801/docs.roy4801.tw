# pkg

## Enable `pkg`

```
vim /usr/local/etc/pkg/repos/local.conf
# yes -> no

vim /usr/local/etc/pkg/repos/FreeBSD.conf
# no -> yes
```

!!!waning
	Backup you config and Think before you run `pkg upgrade`. Otherwise, use `pkg upgrade <package_name>`.

## List outdated packages

```bash
pkg version -l \<
```
