FROM ubuntu:16.04

LABEL description "Test"

# Apache installieren, unnötige Dateien aus dem Paket-Cache
# gleich wieder entfernen
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get -y clean && \
    rm -r /var/cache/apt /var/lib/apt/lists/*

# HTTPS-Unterstützung aktivieren
RUN a2ensite default-ssl && a2enmod ssl

ENV APACHE_RUN_USER=www-data \
    APACHE_RUN_GROUP=www-data \
    APACHE_LOG_DIR=/var/log/apache2

EXPOSE 80 443

# gesamten Inhalt des Projektverzeichnisses
# website nach /var/www/html kopieren
COPY website/ /var/www/html

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
