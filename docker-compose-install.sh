#!/bin/bash



sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

#Next, set the permissions to make the binary executable:
sudo chmod +x /usr/local/bin/docker-compose

#Then, verify that the installation was successful by checking the version:
docker-compose --version