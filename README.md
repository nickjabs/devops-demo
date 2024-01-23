# Run PIMCORE in Benutzerdefiniertes Docker-Image für Pimcore

Dieses Repository erstellt ein Docker-Image basierend auf `serversideup/php:8.2-fpm-nginx` und enthält das modifizierte Repository von [https://github.com/pimcore/demo](https://github.com/pimcore/demo).

## Verwendung

1. Stellen Sie sicher, dass Ihr Docker-Daemon aktiviert ist.

2. Bauen Sie die Docker-Images:
   
   <code>docker-compose build</code>

## Start Container
 <code>docker-compose up -d</code>

## Install Pimcore
 in the running Container <code>docker-compose exec php vendor/bin/pimcore-install --mysql-host-socket=db --mysql-username=pimcore --mysql-password=pimcore --mysql-database=pimcore
</code>

## Check the result
 </link>http://localhost</link> aufrufen.

## Weitere Informationen

Docker-Image: <code>serversideup/php:8.2-fpm-nginx</code>
Originalquelle und Anleitung <code> https://serversideup.net/open-source/docker-php/docs/getting-started/installation</code>
Pimcore Repository:<code> https://github.com/pimcore/demo</code>

## Deployment und Automation 

Bash-Skript in <root> directory zur Bereitstellung der Pimcore-Anwendung <code>deploy.sh</code>
Ausfuehren <code>./deploy.sh</code>

<code>docker-build.yml</code> in <code>workflows</code> the actions workflow will build and push the image to the dokcerhub repository

for testing the CI Gitlab Runner i copied the repo from GitHub in the new created GitLab Account and executed <code>.gitlab-ci.yml</code> manually, which will pull the image from the docker dockerhub repo and build it erneuet.

the envoroment variables credentials stored in github secrets section



