#!/bin/sh

./create_package.sh

apt-get remove nginx php php7.3-fpm php7.3-common mariadb-server php-mysql php-fpm nginx-common
apt-get -y remove ft-server
mv ft_server_package.deb /
cd / && apt install ./ft_server_package.deb
cd /root/ft_server
