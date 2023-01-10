-- task 1
CREATE USER IF NOT EXISTS 'holberton_user'@'localhost' IDENTIFIED BY 'projectcorrection280hbtn';
GRANT REPLICATION CLIENT ON *.* TO 'holberton_user'@'localhost' IDENTIFIED BY 'projectcorrection280hbtn';

-- task 2
CREATE DATABASE IF NOT EXISTS tyrell_corp;
USE tyrell_corp;
CREATE TABLE IF NOT EXISTS nexus6 ( id int, Name varchar(255) );
GRANT SELECT ON tyrell_corp.nexus6 TO 'holberton_user'@'localhost';
INSERT INTO nexus6 (id, name) VALUES (1, "Beloved");

-- task3
CREATE USER IF NOT EXISTS replica_user@'%' IDENTIFIED BY 'replica_passwd';
GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%' IDENTIFIED BY 'replica_passwd';
GRANT SELECT ON mysql.user TO 'holberton_user'@'localhost';


CHANGE REPLICATION SOURCE TO 
SOURCE_HOST='%',
SOURCE_USER='replica_user', SOURCE_PASSWORD='replica_passwd', SOURCE_LOG_FILE='mysql-bin.000002', SOURCE_LOG_POS=154;

CHANGE MASTER TO
MASTER_HOST='35.153.143.199',
MASTER_USER='replica_user',
MASTER_PASSWORD='replica_passwd',
MASTER_LOG_FILE='mysql-bin.000003',
MASTER_LOG_POS=2943;

CHANGE MASTER TO
  RELAY_LOG_FILE='mysql-relay-bin.000002',
  RELAY_LOG_POS=4025;
START SLAVE SQL_THREAD;