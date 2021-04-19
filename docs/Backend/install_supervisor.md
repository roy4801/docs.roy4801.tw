# Supervisor

## Installation

- CentOS7
```bash=
sudo yum install epel-release
sudo yum install supervisor
```

- Config path: `/etc/supervisord.conf`
    - config path of service managed by supervisor
        - `/etc/supervisord.d/`
        - `/etc/supervisor/conf.d`

## Configuration
### systemd config

* File @ `/etc/systemd/system/supervisord.service`

```=
[Unit]
Description=Supervisor daemon

[Service]
Type=forking
ExecStart=/usr/bin/supervisord
ExecStop=/usr/bin/supervisorctl $OPTIONS shutdown
ExecReload=/usr/bin/supervisorctl $OPTIONS reload
KillMode=process
Restart=on-failure
RestartSec=42s

[Install]
WantedBy=multi-user.target
```

Commands

```bash=
systemctl enable supervisord.service
```

### Config for supervisor

```
[program:helloworld]  ;程序的名称
command = dotnet HelloWorld.dll ;执行的命令
directory = /root/www/ ;命令执行的目录
environment = ASPNETCORE__ENVIRONMENT=Production  ;环境变量
user = root                                       ;执行进程的用户
stopsignal = INT
autostart = true  ;是否自动启动
autorestart = true  ;是否自动重启
startsecs = 1  ;自动重启间隔
stderr_logfile = /var/log/helloworld.err.log  ;标准错误日志
stdout_logfile = /var/log/helloworld.out.log  ;标准输出日志
```

## CLI

* Restart supervisor
    - `sudo supervisorctl reload`

* Soft restart
    - `sudo supervisorctl reread && sudo supervisorctl update`

```
supervisorctl shutdown #关闭所有任务

supervisorctl stop|start program_name

supervisorctl status #查看所有任务状态
```


## Reference

<https://www.chengxulvtu.com/supervisor-on-centos-7/>