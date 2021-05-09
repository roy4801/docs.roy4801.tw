# traefik

https://www.digitalocean.com/community/tutorials/how-to-use-traefik-v2-as-a-reverse-proxy-for-docker-containers-on-ubuntu-20-04

## BasicAuth

```toml
[http.middlewares]
  [http.middlewares.login.basicAuth]
    users = [
      "roy4801:$2y$05$qmSUC0EePfGCf6hnabUqeuHHn77cZJu3M2Z095qwxZw6mbiXaF2YG"
    ]
```