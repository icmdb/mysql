# mysql

Customized mysql image with customized config, management, monitoring, backup based on official image.

Moved from icmdb/applications/mysql.

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
    * [prom/prometheus - DockerHub](https://hub.docker.com/r/prom/prometheus)
* [Grafana](https://grafana.com/docs/)
    * [grafana/grafana - DockerHub](https://hub.docker.com/r/grafana/grafana)
    * [Installing using Docker](https://grafana.com/docs/installation/docker/)
* [Using MySQL in Grafana](https://grafana.com/docs/features/datasources/mysql/)
* [1.4.1 Dumping Data in SQL Format with mysqldump - MySQL Docs](https://dev.mysql.com/doc/mysql-backup-excerpt/5.7/en/mysqldump-sql-format.html)
* [MySQL HA/Scalability Guide](https://dev.mysql.com/doc/mysql-ha-scalability/en/)
* [Percona Toolkit Documentation](https://www.percona.com/doc/percona-toolkit/3.0/index.html)


## Quick Start

```bash
git clone https://github.com/icmdb/mysql.git

cd mysql

docker-compose pull

docker-compose up -d

# Remove (Carefully)
docker-compose down
rm -rf ./mysqldata/
rm -rf ./prometheus/
rm -rf ./grafana/
```

Then you can access: 

|Name          |Url                                           |
|--------------|----------------------------------------------|
|phpmyadmin    |[http://127.0.0.1:8080](http://127.0.0.1:8080) (root/Passw0rd4MySQLRoot)|
|mysql-exportor|[http://127.0.0.1:9104/metrics](http://127.0.0.1:9104/metrics) (mysqld-exporter/Passw0rd4MySQLdExporter)|
|prometheus    |[http://127.0.0.1:9090](http://127.0.0.1:9090)|
|grafana       |[http://127.0.0.1:3000](http://127.0.0.1:3000) (admin/Passw0rd4Grafana)|

> Grafana may take 2 minutes to get ready for access!

Recommanded dashboard for mysql: 7362, 7991, 9777

![MySQL Demo](https://raw.githubusercontent.com/icmdb/mysql/master/images/mysql-demo.png)

## Environment

Details see: [docker-compose.yml](https://github.com/icmdb/mysql/blob/master/docker-compose.yml)

* `MYSQL_CREATE_DBS=db1,db2,db3`
* `MYSQL_CREATE_USERS=user1:pass1:db1,user2:pass2:db2,user3:pass3:db3`

## Todo List

* [x] MySQL Configfile for customized
* [x] MySQL Initialize Scripts for autocreate DBs/Users
    * [x] Auto Create Databases
    * [ ] Auto Create Users
* [x] MySQL Dockerfile for autobuild (DockerHub)
* [x] MySQL docker-compose file for on key start 
* [ ] MySQL deployment yaml for kubernetes 
* [x] MySQL Management for easy to use (phpmyadmin)
* [x] MySQL Monitoring for performance/improvement/alert
    * [x] mysql-exportor
    * [x] Prometheus
    * [x] Grafana
* [ ] MySQL Backup for disaster recovery
    * [ ] Backup Scripts
    * [ ] Backup Container
* [x] MySQL Tools
    * [x] MySQL percona-toolkit
* [ ] MySQL HA for production

## Feedback

* [issues - GitHub](https://github.com/icmdb/mysql/issues)
