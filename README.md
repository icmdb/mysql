# mysql

> Moved from icmdb/applications/mysql.

Customized mysql image with customized config, management, monitoring, backup based on official image.

## Reference

* [Get Docker Engine - Community for Ubuntu - Docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
* [Install Docker Compose - Docker](https://docs.docker.com/compose/install/)
* [Best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
    * [Dockerfile最佳实践](https://segmentfault.com/a/1190000018108361)
* [Compose file version 3 reference](https://docs.docker.com/compose/compose-file/)
* [Configuring the Server - MySQL Docs](https://dev.mysql.com/doc/refman/5.7/en/server-configuration.html)
* [mysql - DockerHub](https://hub.docker.com/_/mysql)
* [phpmyadmin](https://www.phpmyadmin.net/)
* [mysqld_exporter - GitHub](https://github.com/prometheus/mysqld_exporter)
* [Prometheus](https://prometheus.io/docs/introduction/overview/)
* [Using MySQL in Grafana](https://grafana.com/docs/features/datasources/mysql/)
* [1.4.1 Dumping Data in SQL Format with mysqldump - MySQL Docs](https://dev.mysql.com/doc/mysql-backup-excerpt/5.7/en/mysqldump-sql-format.html)
* [MySQL HA/Scalability Guide](https://dev.mysql.com/doc/mysql-ha-scalability/en/)


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
