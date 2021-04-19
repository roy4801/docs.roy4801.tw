# Use redis as laravel Queue
## Use predis

- install
`composer require predis/predis`

## Use php-redis
sudo yum install -y php72-php-pecl-redis

## Config

* Edit the `.env`
```
# Queue Type (sync|database|redis)
QUEUE_CONNECTION=redis

REDIS_CLIENT=predis
REDIS_HOST=127.0.0.1
REDIS_PASSWORD=null
REDIS_PORT=6379
```


## Ref

https://laravel.com/docs/7.x/queues
