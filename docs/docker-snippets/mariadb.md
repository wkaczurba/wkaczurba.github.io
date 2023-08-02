# Docker

TOC:

- [Docker](#docker)
  - [docker-compose snippets:](#docker-compose-snippets)


## docker-compose snippets:

[docker-compose.yml](mariadb/docker-compose.yml)

```
version: '3.1'

services:

  db:
    image: mariadb
    restart: always
    environment:
      MARIADB_ROOT_PASSWORD: pass
      MARIADB_USER: user1
      MARIADB_PASSWORD: user1_password
      MARIADB_DATABASE: user1_db # database name to be created for user1
    volumes:
      - ./mounts/mariadb:/var/lib/mysql
    ports:
      - 3307:3306 # Mapping MariaDB -> local: 3307 (conflicts)

  adminer:
    image: adminer
    restart: always
    ports:
      - 8081:8080
```

**start:**
```
#!/bin/bash

docker compose up
```

**stop:**
```
#!/bin/bash

docker compose down

```
