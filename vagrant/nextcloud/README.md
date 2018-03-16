Nextcloud
----------------------

### Übersicht

    +---------------------------------------------------------------+
    ! Notebook - Schulnetz 10.x.x.x und Privates Netz 172.20.10.1   !                 
    ! Port: 8080 (172.20.10.15:80)                                  !
    !                                                               !
    !    +--------------------+          +---------------------+    !
    !    ! Web Server         !          ! Datenbank Server    !    !       
    !    ! Host: web01        !          ! Host: db01          !    !
    !    ! IP: 172.20.10.15   ! <------> ! IP: 172.20.10.16    !    !
    !    ! Port: 80           !          ! Port 3306           !    !
    !    ! Nat: 8080          !          ! Nat: -              !    !
    !    +--------------------+          +---------------------+    !
    !                                                               !
    +---------------------------------------------------------------+

### Beschreibung

* Web Server mit Apache und Nextcloud-Installation
* Datenbank Server mit MySQL

* Die Verbindung Web - Datenbank erfolgt mittels Internen Netzwerk Adapter.
* Von Aussen ist nur der HTTP Port auf dem Web Server Erreichbar.

Um in die VM zu wechseln ist zusätzlich der in Vagrantfile definierte Name einzugeben.

	vagrant ssh db
	vagrant ssh web

Das Nextcloud-Seite ist via [http://localhost:8080](http://localhost:8080) mit User/Password: admin/test erreichbar.

### Tests

* keine

### Sicherheit

* Datenbank Server bzw. MySQL ist mit Password geschützt.
* Der Web Server ist offen und mittels ungeschütztem HTTP Protokoll erreichbar.
