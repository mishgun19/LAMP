#!/bin/bash

user=root
apache2_vh=/home/mihail/configs/apache2/
nginx=/home/mihail/configs/nginx/*
apache2_dir=/etc/apache2/
script=/tmp/script.sql
#script_dir=/tmp
wp=/home/mihail/configs/wordpress/wp-config.php
wp_tg=/var/www/html/wordpress
bot_id=6824574787:AAHem1WcTfWFUV0DFeRsvpub3bVXOFcqwts
chat_id=596585942

read -p "Введите ip адрес целевого сервера: " server

echo "--Update apt--"
ssh $user@$server "apt-get -qqy update && apt-get -qqy install"

echo "--Install parts of LAMP--"
ssh $user@$server "apt-get -qqy install nginx apache2 php libapache2-mod-php php-mysql mysql-server"
#ssh $user@$server "apt-get -qqy install apache2 php libapache2-mod-php php-mysql mysql-server"

echo "--Virtual hosts for Apache--"
scp $apache2_vh/vh_lamp.conf $user@$server:$apache2_dir/sites-available
scp $apache2_vh/ports.conf $user@$server:$apache2_dir
ssh $user@$server "a2ensite vh_lamp && a2dissite 000-default.conf && systemctl restart apache2"

echo "--NGINX--"
scp $nginx $user@$server:/etc/nginx/sites-available/
ssh $user@$server "systemctl restart nginx"

echo "--Script for new database for Wordpress--"
scp $script $user@$server:/tmp
ssh $user@$server "mysql -u root < /tmp/script.sql"

echo "--Download Wordpress--"
ssh $user@$server "wget -qqO /tmp/wordpress.zip  https://wordpress.org/latest.zip && unzip -qq -o /tmp/wordpress.zip -d /var/www/html/"
scp $wp $user@$server:$wp_tg

# "Отправка уведомления в TG"
curl -s -X POST https://api.telegram.org/bot$bot_id/sendMessage -d chat_id=$chat_id -d text="Успешно развёрнуто на сервере"+$server > /dev/null
