-- Initialize                                                                                         
-- -- Start
SELECT CONCAT('0: ', CURRENT_TIMESTAMP()) INTO OUTFILE '/var/lib/mysql-files/0.start.log';

-- -- Done
SELECT CONCAT('9: ', CURRENT_TIMESTAMP()) INTO OUTFILE '/var/lib/mysql-files/9.end.log'; 
