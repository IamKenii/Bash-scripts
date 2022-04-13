**Database for wordpress.**

sudo mysql -uroot -p

create database wordpress;

GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' IDENTIFIED BY 'YOURPASSWORD';

FLUSH PRIVILEGES;

EXIT
