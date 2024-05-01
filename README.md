# nextcloud-nginx

## Include
 - db: mysql
 - app: php
 - web: nginx

## Set up:
### Update info for .env file
 - NEXTCLOUD_MOUNT=/data1/nextcloud
 - MYSQL_ROOT_PASSWORD=
 - MYSQL_DATABASE=
 - MYSQL_USER=
 - MYSQL_PASSWORD=
 - MYSQL_HOST=11.11.0.8
 - #MYSQL_ALLOW_EMPTY_PASSWORD=yes
 - NEXTCLOUD_HOST=11.11.0.9
 - NETWORK_SUBNET=11.11.0.0/24
 - NETWORK_GATEWAY=11.11.0.1
 - NGINX_HOST=11.11.0.10
### Generate a Self-Signed Certificate
 - cd tls
 - cat README.md
### Update upstream with the correct network
 - chmod +x configure
 - ./configure
### Build app.
 - docker build -t nexcloud-fpm .
### Start app
 - docker compose up -d