# mysql

Mysql image with customized config file (moved from icmdb/applications/mysql).

## Reference

* [mysql dockerhub](https://hub.docker.com/_/mysql)
* [Configuring the Server - mysqldocs](https://dev.mysql.com/doc/refman/5.7/en/server-configuration.html)


## Quick Start

```bash
git clone https://github.com/icmdb/mysql.git

cd mysql

docker-compose pull

docker-compose up -d
```

## Todo List

* [x] Image autobuild
* [x] Configfile
* [x] Initialize script
* [x] mysql-exportor
