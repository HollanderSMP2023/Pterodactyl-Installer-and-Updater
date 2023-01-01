#!/bin/sh
    sudo timedatectl set-timezone Europe/Amsterdam

    sudo -i

    iptables -P INPUT ACCEPT
    iptables -P OUTPUT ACCEPT
    iptables -P FORWARD ACCEPT
    iptables -F

    apt -y install software-properties-common curl apt-transport-https ca-certificates gnupg

    LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
    add-apt-repository ppa:redislabs/redis -y

    curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash

    apt update

    apt-add-repository universe

    apt -y install php8.1 php8.1-{common,cli,gd,mysql,mbstring,bcmath,xml,fpm,curl,zip} mariadb-server nginx tar unzip git redis-server

    echo: 'test ip ---> nginx!'

    curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

    mkdir -p /var/www/pterodactyl
    cd /var/www/pterodactyl

    curl -Lo panel.tar.gz https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz
    tar -xzvf panel.tar.gz
    chmod -R 755 storage/* bootstrap/cache/

    mysql -u root -p

    Rz$nWxgg

    CREATE USER 'pterodactyl'@'127.0.0.1' IDENTIFIED BY 'Rz$nWxgg';

    CREATE DATABASE panel;

    GRANT ALL PRIVILEGES ON panel.* TO 'pterodactyl'@'127.0.0.1' WITH GRANT OPTION;
    exit

    cp .env.example .env
    composer install --no-dev --optimize-autoloader

    yes

    php artisan key:generate --force

    php artisan p:environment:setup

    tijshollander33@gmail.com

    https://panel.hollandernodes.tk

    Europe/Amsterdam

    redis 3x

    yes

    no

    localhost

    

    6379

    php artisan p:environment:database

    127.0.0.1

    3306

    panel

    pterodactyl

    Rz$nWxgg

    php artisan migrate --seed --force

    php artisan p:user:make

    yes

    tijshollander33@gmail.com

    Hollander

    Tijs

    Hollander

    Rz$nWxgg

    chown -R www-data:www-data /var/www/pterodactyl/*

    sudo crontab -e

    1

    * * * * * php /var/www/pterodactyl/artisan schedule:run >> /dev/null 2>&1

    nano /etc/systemd/system/pteroq.service

    # Pterodactyl Queue Worker File
    # ----------------------------------

    [Unit]
    Description=Pterodactyl Queue Worker
    After=redis-server.service

    [Service]
    # On some systems the user and group might be different.
    # Some systems use `apache` or `nginx` as the user and group.
    User=www-data
    Group=www-data
    Restart=always
    ExecStart=/usr/bin/php /var/www/pterodactyl/artisan queue:work --queue=high,standard,low --sleep=3 --tries=3
    StartLimitInterval=180
    StartLimitBurst=30
    RestartSec=5s

    [Install]
    WantedBy=multi-user.target


    sudo systemctl enable --now redis-server

    sudo systemctl enable --now pteroq.service



    sudo apt update
    sudo apt install -y certbot

    sudo apt install -y python3-certbot-nginx

    echo: add ip to cloudflare! ----> test

    certbot certonly --nginx -d panel.hollandernodes.tk

    tijshollander33@gmail.com

    A

    N

    certbot renew

    systemctl stop nginx

    certbot renew

    systemctl start nginx



    rm /etc/nginx/sites-enabled/default

    nano /etc/nginx/sites-available/pterodactyl.conf

    server_tokens off;

    server {
        listen 80;
        server_name panel.hollandernodes.tk;
        return 301 https://$server_name$request_uri;
    }

    server {
        listen 443 ssl http2;
        server_name panel.hollandernodes.tk;

        root /var/www/pterodactyl/public;
        index index.php;

        access_log /var/log/nginx/pterodactyl.app-access.log;
        error_log  /var/log/nginx/pterodactyl.app-error.log error;

        # allow larger file uploads and longer script runtimes
        client_max_body_size 100m;
        client_body_timeout 120s;

        sendfile off;

        # SSL Configuration - Replace the example panel.hollandernodes.tk with your domain
        ssl_certificate /etc/letsencrypt/live/panel.hollandernodes.tk/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/panel.hollandernodes.tk/privkey.pem;
        ssl_session_cache shared:SSL:10m;
        ssl_protocols TLSv1.2 TLSv1.3;
        ssl_ciphers "ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384";
        ssl_prefer_server_ciphers on;

        # See https://hstspreload.org/ before uncommenting the line below.
        # add_header Strict-Transport-Security "max-age=15768000; preload;";
        add_header X-Content-Type-Options nosniff;
        add_header X-XSS-Protection "1; mode=block";
        add_header X-Robots-Tag none;
        add_header Content-Security-Policy "frame-ancestors 'self'";
        add_header X-Frame-Options DENY;
        add_header Referrer-Policy same-origin;

        location / {
            try_files $uri $uri/ /index.php?$query_string;
        }

        location ~ \.php$ {
            fastcgi_split_path_info ^(.+\.php)(/.+)$;
            fastcgi_pass unix:/run/php/php8.1-fpm.sock;
            fastcgi_index index.php;
            include fastcgi_params;
            fastcgi_param PHP_VALUE "upload_max_filesize = 100M \n post_max_size=100M";
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            fastcgi_param HTTP_PROXY "";
            fastcgi_intercept_errors off;
            fastcgi_buffer_size 16k;
            fastcgi_buffers 4 16k;
            fastcgi_connect_timeout 300;
            fastcgi_send_timeout 300;
            fastcgi_read_timeout 300;
            include /etc/nginx/fastcgi_params;
        }

        location ~ /\.ht {
            deny all;
        }
    }



    sudo ln -s /etc/nginx/sites-available/pterodactyl.conf /etc/nginx/sites-enabled/pterodactyl.conf


    sudo systemctl restart nginx


    echo: go to panel and login!
