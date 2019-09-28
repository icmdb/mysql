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

* [x] MySQL Configfile for customized
* [x] MySQL Initialize Scripts for autocreate DBs/Users
    * [x] Auto Create Databases
    * [ ] Auto Create Users
* [x] MySQL Dockerfile for autobuild (DockerHub)
* [x] MySQL docker-compose file for on key start 
* [ ] MySQL deployment yaml for kubernetes 
* [x] MySQL Management for easy to use (phpmyadmin)
* [ ] MySQL Monitoring for performance/improvement/alert
    * [x] mysql-exportor
    * [ ] Prometheus
    * [ ] Grafana
* [ ] MySQL Backup for disaster recovery
    * [ ] Backup Scripts
    * [ ] Backup Container
* [ ] MySQL HA for production
