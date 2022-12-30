#!/bin/sh
  echo "Enter Root Mode"
  sudo -i

  echo "Updating DB"
  npx update-browserslist-db@latest
  
  echo "Install LSB Release"
  apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
  
  echo "Enter Node Source"
  curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
  
  echo "Install NodeJS"
  apt -y install nodejs
  
  echo "cd pterodactyl"
  cd /var/www/pterodactyl
  
  echo "Wings"
  wings --debug
  
 
