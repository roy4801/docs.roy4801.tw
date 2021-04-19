# Queue

## Setup
### Databawse

```bash
php artisan queue:table
php artisan queue:failed-table
php artisan migrate
```

### Redis

* see [use_redis_as_mq](/Backend/laravel/use_redis_as_mq/)

## Usage

```bash
# Restart the worker
php artisan queue:restart
```

## Use supervisord to start laravel worker

- Config path
    ```
    sudo vim /etc/supervisord.d/laravel-worker.conf
    ```

- `laravel-work.conf` or `laravel-work.ini` (see config)
    ```
    [program:laravel-worker]
    process_name=%(program_name)s_%(process_num)02d
    command=php /usr/share/CLM/html/v2/artisan queue:work --queue=high,default
    autostart=true
    autorestart=true
    user=nspectrum
    numprocs=5
    redirect_stderr=true
    stdout_logfile=/var/log/laravel/worker.log
    stopwaitsecs=3600
    ```

- Start the processes

```bash
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl start laravel-worker:*

# Broadcast the restart message
php artisan queue:restart
```