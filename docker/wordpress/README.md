Wordpress
----------------------

### Übersicht

    +---------------------------------------------------------------+
    ! vServer Ubuntu 16.04                                          !                 
    ! Port: 8080 (185.178.192.48)                                   !
    !                                                               !
    !    +--------------------+          +---------------------+    !
    !    ! Web Server         !          ! Datenbank Server    !    !       
    !    ! Host: wordpress    !          ! Host: db            !    !
    !    ! Port: 80           !          ! Port 3306           !    !
    !    ! Nat: 8080          !          ! Nat: -              !    !
    !    +--------------------+          +---------------------+    !
    !                                                               !
    +---------------------------------------------------------------+

### Beschreibung

* Wordpress Container mit Apache
* Datenbank Container mit Mariadb

* Die Verbindung Web - Datenbank erfolgt mittels Internen Netzwerk Adapter.
* Von Aussen ist nur der HTTP Port auf dem Web Server Erreichbar.

### Erstellen und Starten der VM's

    cd wordpress
    docker-compose up -d

Die Dateien werden lokal im Verzeichnis /var abgelegt:

    volumes:
      - /var/containers/wordpress-test/web:/var/www/html

    volumes:
      - /var/containers/wordpress-test/mysql:/var/lib/mysql

Das Nextcloud-Seite ist via [http://185.178.192.48:8080](http://185.178.192.48:8080) erreichbar.

    ports:
        - "8080:80"

### Tests

* http://185.178.192.48:8080 aufrufen.

### Sicherheit

* Datenbank Server bzw. MySQL ist mit Password geschützt.
* Der Web Server ist offen und mittels ungeschütztem HTTP Protokoll erreichbar.
