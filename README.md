# Run PIMCORE in Benutzerdefiniertes Docker-Image für Pimcore

Dieses Repository erstellt ein Docker-Image basierend auf `serversideup/php:8.2-fpm-nginx` und enthält das modifizierte Repository von [https://github.com/pimcore/demo](https://github.com/pimcore/demo).

## Verwendung

1. Stellen Sie sicher, dass Ihr Docker-Daemon aktiviert ist.

2. Bauen Sie die Docker-Images:
   ```bash
   docker-compose build

##
Starten Sie die Container <code>docker-compose up -d</code>
Installieren Sie Pimcore in den Containern <code>docker-compose exec php vendor/bin/pimcore-install --mysql-host-socket=db --mysql-username=pimcore --mysql-password=pimcore --mysql-database=pimcore
</code>
Überprüfen Sie im Browser, ob die Installation erfolgreich war, indem Sie </link>http://localhost</link> aufrufen.

## Weitere Informationen

Docker-Image: <code>serversideup/php:8.2-fpm-nginx</code>
Originalquelle und Anleitung <code> https://serversideup.net/open-source/docker-php/docs/getting-started/installation</code>
Pimcore Repository:<code> https://github.com/pimcore/demo</code>

## Deployment und Automation 

Bash-Skript zur Bereitstellung der Pimcore-Anwendung <code>deploy.sh</code>
Ausfuehren <code>./deploy.sh</code>

deploy your application using GitLab CI/CD.



