# Lab 9

## MySQL

### Dockerfile

- ENV for MYSQL_ROOT_PASSWORD to be [PASSWORD] and MYSQL_DATABASE to be flask-db
- COPY the sql file to  /docker-entrypoint-initdb.d

### run
- need a volume to be mounted on /var/lib/mysql
- need the container name mysql

## flask app

### Docker file
- build an image from the provided dockerfile

### run
- same network as mysql container
- name must be flask-app

## nginx

### run

bind mount nginx.conf into /etc/nginx
