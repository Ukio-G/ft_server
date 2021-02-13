#!/bin/sh

./create_package.sh
apt-get -y remove ft-server
cp ft_server_package.deb /
cd / && apt install ./ft_server_package.deb
cd /root/ft_server
