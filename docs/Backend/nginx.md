# nginx

## let's encrypt + certbot

```bash linenums="1"
sudo apt install certbot python3-certbot-nginx
```

!!!warning
	`AttributeError: module 'acme.challenges' has no attribute 'TLSSNI01'`?

	```bash linenums="1"
	curl -o- https://raw.githubusercontent.com/vinyll/certbot-install/master/install.sh | bash
	```
