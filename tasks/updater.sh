#!/bin/sh
  echo "Enter Root Mode"
  sudo su
  
  echo "Updating Host"
  sudo apt update
  sudo apt upgrade -y

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
  
  echo "Yarn"
  npm i -g yarn
  
  echo "Updating DB"
  npx update-browserslist-db@latest
  
  echo "Yarn"
  yarn install
  
  echo "Updating DB"
  npx update-browserslist-db@latest
  
  echo "Yarn production"
  yarn build:production
  
  echo "Set permissions"
  chown -R www-data:www-data *
  
  echo "Set permissions"
  sudo chmod 777 *
  
  echo "Updating Host"
  sudo apt update
  sudo apt upgrade -y
  
  
  echo "Done!"
