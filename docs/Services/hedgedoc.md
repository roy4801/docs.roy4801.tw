# hedgedoc

## docker

- `docker-compose.yml`

```linenums="1"
version: '3'
services:
  database:
    image: postgres:13.4-alpine
    environment:
      - POSTGRES_USER=hedgedoc
      - POSTGRES_PASSWORD=PASSWORD
      - POSTGRES_DB=hedgedoc
    volumes:
      - ./database:/var/lib/postgresql/data
    restart: always
  app:
    # Make sure to use the latest release from https://hedgedoc.org/latest-release
    image: quay.io/hedgedoc/hedgedoc:1.9.2
    environment:
      - CMD_DB_URL=postgres://hedgedoc:PASSWORD@database:5432/hedgedoc
      - CMD_DOMAIN=<your-hedgedoc-url>
      - CMD_URL_ADDPORT=false

      # User and Privileges
      - CMD_ALLOW_ANONYMOUS=false
      - CMD_GITLAB_BASEURL=https://<your-gitlab-url>
      - CMD_GITLAB_CLIENTID=*************
      - CMD_GITLAB_CLIENTSECRET=*************
    
      # Registeration
      - CMD_EMAIL=true
      - CMD_ALLOW_EMAIL_REGISTER=false
    volumes:
      - ./uploads:/hedgedoc/public/uploads
    ports:
      - "80:3000"
    restart: always
    depends_on:
      - database
```

!!!info
	Need to set the write permission for others to the Upload directory when using the volume mapping in docker
