# mysql

Mysql image with customized config file (moved from icmdb/applications/mysql).

## Reference

* [Get Docker Engine - Community for Ubuntu - Docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
* [Install Docker Compose - Docker](https://docs.docker.com/compose/install/)
* [mysql - DockerHub](https://hub.docker.com/_/mysql)
* [Configuring the Server - MySQL Docs](https://dev.mysql.com/doc/refman/5.7/en/server-configuration.html)


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
* [ ] Backup scripts
* [ ] Auto Create Databases
* [ ] Auto Create Users
