STOP SLAVE;

CHANGE MASTER TO
MASTER_HOST='database-master',
MASTER_USER='repluser',
MASTER_PASSWORD='replsecret',
MASTER_PORT=3306,
MASTER_CONNECT_RETRY=1;

START SLAVE;


SHOW SLAVE STATUS;


#CREATE USER JUST READ TABLE

CREATE USER IF NOT EXISTS 'read'@'localhost' IDENTIFIED BY 'read';
GRANT SELECT ON *.* TO 'read'@'localhost';
FLUSH PRIVILEGES;
