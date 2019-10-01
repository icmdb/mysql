FROM mysql:5.7.27
COPY conf/mysqld.cnf   /etc/mysql/mysql.conf.d/mysqld.cnf
COPY conf/my.cnf       /root/.my.cnf
COPY init/             /docker-entrypoint-initdb.d
COPY mysql-backup.sh   /mysql-backup.sh
RUN    apt-get update && apt-get -y install \
           percona-toolkit \
    && apt-get -y autoremove && apt-get clean all \
    && rm -rf /var/lib/apt/* \
    && rm -rf /usr/share/man/* \
    && rm -rf /usr/share/man/doc/* \
    && mkdir -p /backup/ \
    && chown 999:999 /docker-entrypoint-initdb.d/9-init.sql
VOLUME ["/var/lib/mysql/", "/var/lib/mysql-files/", "/backup/"]
