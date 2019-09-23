FROM mysql:5.7.27
COPY conf /etc/mysql/mysql.conf.d
COPY init docker-entrypoint-initdb.d
