## Running PIMCORE in a Custom Docker Image for Pimcore

This repository creates a Docker image based on <code>serversideup/php:8.2-fpm-nginx </code> and includes a modified version of the repository from <code>https://github.com/pimcore/demo</code>

## Usage

Ensure that your Docker daemon is running.
Build the Docker images:
<code>docker-compose build</code>

## Start Containers
<code>docker-compose up -d</code>

## Install Pimcore 
<code>docker-compose exec php vendor/bin/pimcore-install --mysql-host-socket=db --mysql-username=pimcore --mysql-password=pimcore --mysql-database=pimcore<code>

## Check the Result
Visit <link>http://localhost</link>

## Additional Information
Base Docker Image: <code>serversideup/php:8.2-fpm-nginx</code>
Original Source and Instructions: <code>https://serversideup.net/open-source/docker-php/docs/getting-started/installation</code>
Pimcore Repository: <code> https://github.com/pimcore/demo</code>

## Deployment and Automation
A Bash script in the root directory for deploying the Pimcore application:<code>./deploy.sh</code>

## For CI/CD:

<code>docker-build.yml</code> in the workflows folder: The GitHub Actions workflow builds and pushes the image to the Docker Hub repository.
![Alt text](<.github/screens/Screenshot 2024-01-26 140132.png>)

To test the CI Gitlab Runner, the repository was copied from GitHub to a new GitLab account, and <code>.gitlab-ci.yml</code> was manually executed. This file pulls the image from the Docker Hub repository and rebuilds it. Environment variable credentials are stored in the GitHub Secrets section.
![Alt text](<.github/screens/Screenshot 2024-01-26 123953.png>)![Alt text](<.github/screens/Screenshot 2024-01-26 123942.png>)
## Infrastructure
A simple EC2 instance will be created (source in the infrastructure folder). Then, on the EC2 instance, the Ansible playbook is executed to deploy the application (source in the ansible folder).