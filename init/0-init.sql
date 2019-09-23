-- Initialize                                                                                         
-- -- Start
SELECT CONCAT('0: ', CURRENT_TIMESTAMP()) INTO OUTFILE '/var/lib/mysql-files/0.start.log';

-- -- Create user
CREATE USER 'mysqld-exporter'@'mysql' IDENTIFIED BY 'mysqld-exporter-password' WITH MAX_USER_CONNECTIONS 3;
GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'mysqld-exporter'@'%';
SELECT CONCAT('1: ', CURRENT_TIMESTAMP()) INTO OUTFILE '/var/lib/mysql-files/1.log';

-- -- Done
SELECT CONCAT('9: ', CURRENT_TIMESTAMP()) INTO OUTFILE '/var/lib/mysql-files/9.end.log'; 
