#!/bin/bash

set -e
SCRIPT_VERSION="Version 1.0"

clear
echo
#print_brake 70
echo "* Pterodactyl-Updater @ $SCRIPT_VERSION"
echo
echo "* Copyright (C) 2021 - 2022."
echo "* https://github.com/HollanderSMPW/Pterodactyl-Updater/"
echo
echo "* This script is not associated with the official Pterodactyl Project."
#print_brake 70
echo
echo "1. Update some stuff"
echo "2. Wings debug"
echo "3. Install DarkNred Theme"
echo "4. Backup the panel files"
echo "5. Restore from backup"
echo "6. Close / Cancel"
read -p "Please enter a number: " choice
if [ $choice == "1" ]
    then
    echo "Update some stuff..."
    bash <(curl -s https://raw.githubusercontent.com/Sigma-Production/PteroFreeStuffinstaller/V1.10.1/resources/DarkNColor.sh)
fi
if [ $choice == "2" ]
    then
    echo "Wings debug..."
    bash <(curl -s https://raw.githubusercontent.com/Sigma-Production/PteroFreeStuffinstaller/V1.10.1/resources/Addons.sh)
fi
if [ $choice == "3" ]
    then
    echo "Install DarkNred Theme..."
    bash <(curl -sSL https://raw.githubusercontent.com/Sigma-Production/PteroFreeStuffinstaller/V1.10.1/resources/ParticleJS/install.sh)
fi
if [ $choice == "4" ]
    then
    echo "Backup the panel files..."
    bash <(curl -sSL https://raw.githubusercontent.com/Sigma-Production/PteroFreeStuffinstaller/V1.10.1/resources/mcTheme/install.sh)
fi
if [ $choice == "5" ]
    then
    echo "Restore from backup..."
    bash <(curl -s https://raw.githubusercontent.com/Sigma-Production/PteroFreeStuffinstaller/V1.10.1/resources/login/install.sh)
fi
if [ $choice == "6" ]
    then
    echo "Canceling..."
    exit 0
fi
