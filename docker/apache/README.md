Ubuntu/Docker mit Apache
------------------------

### Übersicht

    +---------------------------------------------------------------+
    !                                                               !
    !    +-------------------------+                                !
    !    ! Web-Server              !                                !       
    !    ! Port: 80                !                                !       
    !    ! Volume: /var/www/html   !                                !       
    !    +-------------------------+                                !
    !                                                               !
    ! Container                                                     !
    +---------------------------------------------------------------+
    ! Container-Engine: Docker                                      !
    +---------------------------------------------------------------+
    ! Gast OS: Ubuntu 16.04                                         !
    +---------------------------------------------------------------+
    ! Host-OS: Linux                                                !
    +---------------------------------------------------------------+
    ! vServer - 185.178.192.48                                      !                 
    +---------------------------------------------------------------+

### Beschreibung

Die Datei richtet ein Image ein, das auf dem Base Image von Ubuntu 16.04 basiert.
Dort wird zusätzlich der Webserver Apache installiert. Dieser wird mit a2ensite und
a2enmod auch für den HTTPS-Betrieb konfiguriert. Dementsprechend sollen die Ports
80 und 443 des Containers nach außen hin zugänglich sein.

**Projektdateien**

Das lokale Verzeichnis website, das sich im gleichen Verzeichnis wie das Dockerfile
befindet, enthält die Datei index.html. Der gesamte Inhalt
dieses Verzeichnisses wird durch die COPY-Anweisung im Dockerfile in das Verzeichnis
/var/www/html des Containers kopiert.

**Image erstellen**

    docker build -t apache .
    docker run --rm -d -p 8080:80 -v `pwd`/web:/var/www/html --name apache apache
    docker run -d -p 80:80 -p 443:443 --name apache apache

**Testen**

- http://185.178.192.48:8080 aufrufen.
