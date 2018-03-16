# Mysql-Server Installtion

sudo apt update

# root Passwort setzen
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password test'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password test'

# Mysql-Server installieren
sudo apt -y install mysql-server-5.7

# Mysql Port oeffnen
sudo sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

# Datenbank und Benutzer für Nextcloud einrichten
mysql -uroot -ptest <<%EOF%
    CREATE DATABASE nextcloud;
    CREATE USER 'nextcloud'@'172.20.10.15' IDENTIFIED BY 'test';
    GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextcloud'@'172.20.10.15';
    FLUSH PRIVILEGES;
%EOF%

# Mysql Neu starten
sudo systemctl restart mysql
