#!/bin/bash
#

set -x

mysqldata="/var/lib/mysql"
backupdir="/backup"
backuplog="/backup/backup.log"
datetime="$(date +%F%T%z|tr -d ':-')"
keepdays="7"

MYSQL_ROOT_PASSWORD="${MYSQL_ROOT_PASSWORD}"

if [ -z "${MYSQL_ROOT_PASSWORD}" ]; then
    echo "[$(date '+%F %T%z')] MYSQL_ROOT_PASSWORD is empty, exiting." | tee -a ${backuplog}
    exit
fi

mkdir -pv ${backupdir}/temp/
cd        ${mysqldata}/

for db in $(ls -p|grep /|grep -v 'performance_schema\|sys'|tr -d '/')
do
    echo "[$(date '+%F %T%z')] Start backup ${db}." | tee -a ${backuplog}
    mysqldump -h 127.0.0.1 -uroot -p${MYSQL_ROOT_PASSWORD} ${db} > ${backupdir}/temp/${db}.${datetime}.sql &
done
wait
echo "[$(date '+%F %T%z')] End backup." | tee -a ${backuplog}
gzip ${backupdir}/temp/*.sql

cd ${backupdir}/temp/
for f in $(ls); do mv ${backupdir}/temp/${f} ${backupdir}/; done

cd ${backupdir}
find ./ -type f -name \*.sql.gz -ctime +${keepdays}  | tee -a ${backuplog}
find ./ -type f -name \*.sql.gz -ctime +${keepdays}  -delete

