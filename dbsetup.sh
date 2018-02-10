#!/usr/bin/env bash

ROOT_DEF_PASS=""
ROOT_PASS="defaultpassword"

echo "Installing mysql-server pre-requisites"
apt-get update 2> /dev/null
apt-get install -q -y debconf-utils >> /vagrant/vm_build.log 2>&1
debconf-set-selections <<< "mysql-server mysql-server/root_password password $ROOT_PASS"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $ROOT_PASS"

echo "Installing mysql-server"
apt-get update 2> /dev/null
apt-get install -q -y mysql-server >> /vagrant/vm_build.log 2>&1

# echo "Securing mysql-server"
# mysql -e "UPDATE mysql.user SET Password=PASSWORD('$ROOT_PASS') WHERE User='root';"
# mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
# mysql -e "DELETE FROM mysql.user WHERE User='';"
# mysql -e "DROP DATABASE test;"
# mysql -e "FLUSH PRIVILEGES;"