FROM mysql:5.7.27
COPY conf/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
COPY conf/my.cnf     /root/.my.cnf
COPY init /docker-entrypoint-initdb.d
RUN chown 999:999 /docker-entrypoint-initdb.d/9-init.sql
