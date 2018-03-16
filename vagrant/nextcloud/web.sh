# Apache Webserver und Nextcloud Installation

sudo apt update

# Apache installieren
sudo apt -y install apache2

# PHP-Erweiterungen installieren
sudo apt -y install php-mbstring php php-zip php-xml php-common php-gd php-curl

# Nextcloud installieren
sudo wget https://download.nextcloud.com/server/releases/nextcloud-12.0.4.zip
sudo apt -y install unzip
sudo unzip nextcloud-12.0.4.zip
sudo mv ./nextcloud/* /var/www/html
sudo chown -R www-data:www-data /var/www/html
sudo apt-get install libapache2-mod-php7.0 php7.0-gd php7.0-json php7.0-mysql php7.0-curl
sudo apt-get install php7.0-mbstring php7.0-intl php7.0-mcrypt php-imagick php7.0-xml php7.0-zip

# Maschine Neu starten
sudo reboot
