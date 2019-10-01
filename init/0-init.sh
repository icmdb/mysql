#!/bin/bash

MYSQL_USER="${MYSQL_USER}"
MYSQL_PASSWORD="${MYSQL_PASSWORD}"
MYSQL_DB_DEBUG="${MYSQL_DB_DEBUG:=0}"
MYSQL_DB_HOST="${MYSQL_DB_HOST:=localhost}"
MYSQL_DB_PORT="${MYSQL_DB_PORT:=3306}"
MYSQL_DB_USER="${MYSQL_DB_USER:=root}"
MYSQL_DB_PASS="${MYSQL_DB_PASS:=$MYSQL_ROOT_PASSWORD}"
MYSQL_CREATE_DBS="${MYSQL_CREATE_DBS//,/  }"        # db1,db2,db3
MYSQL_CREATE_USERS="${MYSQL_CREATE_USERS//,/  }"    # user1:pass1:db1,user2:pass2:db2,user3:pass3:db3


[ ${MYSQL_DB_DEBUG} -eq 1 ] && set -x

if [ "${MYSQL_USER}" == "mysqld-exporter" ]; then
    mysql -h ${MYSQL_DB_HOST} -uroot -p${MYSQL_DB_PASS} -e "CREATE USER IF NOT EXISTS 'mysqld-exporter'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}' WITH MAX_USER_CONNECTIONS 3;"
    mysql -h ${MYSQL_DB_HOST} -uroot -p${MYSQL_DB_PASS} -e "GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'mysqld-exporter'@'%'; FLUSH PRIVILEGES;"
fi


if [ ! -z "${MYSQL_CREATE_DBS}" ]; then
    echo ""
    for db in ${MYSQL_CREATE_DBS}
    do
        mysql -h ${MYSQL_DB_HOST} -uroot -p${MYSQL_DB_PASS} -e "CREATE DATABASE IF NOT EXISTS ${db} DEFAULT CHARACTER SET utf8;"
        if [ $? -ne 0 ]; then
            echo "[$(date '+%F %T%z')] Create database failed."
        fi
    done
    echo ""
fi

if [ ! -z "${MYSQL_CREATE_USERS}" ]; then
    echo ""
    for user in ${MYSQL_CREATE_USERS}
    do
        dbuser="$(echo $user|awk -F: '{print $1}')"
        dbpass="$(echo $user|awk -F: '{print $2}')"
        dbname="$(echo $user|awk -F: '{print $3}')"
        #mysql -h ${MYSQL_DB_HOST} -uroot -p${MYSQL_DB_PASS} -e "CREATE USER IF NOT EXISTS ${dbuser} IDENTIFIED BY '${dbpass}';"
        mysql -h ${MYSQL_DB_HOST} -uroot -p${MYSQL_DB_PASS} -e "GRANT ALL PRIVILEGES ON ${dbname}.* to '${dbuser}'@'%' IDENTIFIED BY '${dbpass}' WITH GRANT OPTION; FLUSH PRIVILEGES;"
    done
    echo ""
fi
