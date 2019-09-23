#!/bin/bash

MYSQL_DB_DEBUG="${MYSQL_DB_DEBUG:=0}"
MYSQL_DB_HOST="${MYSQL_DB_HOST:=localhost}"
MYSQL_DB_PORT="${MYSQL_DB_PORT:=3306}"
MYSQL_DB_USER="${MYSQL_DB_USER:=root}"
MYSQL_DB_PASS="${MYSQL_DB_PASS:=$MYSQL_ROOT_PASSWORD}"
MYSQL_CREATE_DBS="${MYSQL_CREATE_DBS//,/  }" # test1,test2,test3


[ ${MYSQL_DB_DEBUG} -eq 1 ] && set -xue


if [ -z "${MYSQL_DB_HOST}" -o -z "${MYSQL_DB_PASS}" -o -z "MYSQL_CREATE_DBS" ]; then
    echo ""
    echo "[$(date '+%F %T%z')] One or more in MYSQL_DB_HOST, MYSQL_DB_PASS, MYSQL_CREATE_DBS may be empty, skip create databases!"
    echo ""
else
    if [ ! -z "${MYSQL_CREATE_DBS}" ]; then
        echo ""
        for db in ${MYSQL_CREATE_DBS}
        do
            mysql -h ${MYSQL_DB_HOST} -uroot -p${MYSQL_DB_PASS} -e "CREATE DATABASE IF NOT EXISTS ${db} DEFAULT CHARACTER SET utf8;"
            echo "CREATE DATABASE IF NOT EXISTS ${db} DEFAULT CHARACTER SET utf8;"  >> /docker-entrypoint-initdb.d/9-init.sql;
            if [ $? -ne 0 ]; then
                echo "[$(date '+%F %T%z')] Create database failed."
            fi
        done
        echo ""
    fi
fi

