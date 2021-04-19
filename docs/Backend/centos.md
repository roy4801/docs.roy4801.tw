## Register as a service

* Write a `xxx.service` file and put it into `/etc/systemd/system/xxx.service`

```
[Unit]
Description=CLM

[Service]
Restart=on-failure
RestartSec=60s
Type=simple
User=nspectrum
Group=nspectrum
ExecStart=/usr/bin/php /usr/share/CLM/html/v2/artisan serve --port=6660
Restart=always

[Install]
WantedBy=multi-user.target
```

* TODO
```
systemctl daemon-reload
```

## Firewall

```
sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --zone=public --permanent --add-port=8080/tcp
sudo firewall-cmd --reload
```

