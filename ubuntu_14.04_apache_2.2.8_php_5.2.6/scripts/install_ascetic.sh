#!/bin/bash
#---------------------------------------------------------------
# install mysql 5.0
#---------------------------------------------------------------
echo "---- run install LAMP (OLD-OLD-OLD!!!) ----">>/usr/local/src/ascetic/log.log
echo "---- run install mysql ----">>/usr/local/src/ascetic/log.log
sudo apt-get install libncurses5-dev -y
#---------------------------------------------------------------
groupadd mysql
useradd -g mysql mysql
#---------------------------------------------------------------
cd /usr/local/src
#wget -c -t 3 -O ./mysql-5.0.51b.tar.gz http://info.scansend.su/mysql-5.0.51b.tar.gz
tar xvfz mysql-5.0.51b.tar.gz
cd mysql-5.0.51b
./configure --prefix=/usr/local/mysql
make
make install
#---------------------------------------------------------------
cp support-files/my-medium.cnf /etc/my.cnf
cd /usr/local/mysql
chown -R mysql  .
chgrp -R mysql  .
bin/mysql_install_db --user=mysql
chown -R root .
chown -R mysql var
#--------------------------------------------------------------
alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin
#--------------------------------------------------------------
bin/mysqld_safe --user=mysql &
#--------------------------------------------------------------
echo "---- END of install mysql ----">>/usr/local/src/ascetic/log.log
#--------------------------------------------------------------
# install apache
#--------------------------------------------------------------
echo "---- run install apache ----">>/usr/local/src/ascetic/log.log
cd /usr/local/src
#wget -c -t 3 -O '/usr/local/src/httpd-2.2.8.tar.gz'  'http://archive.apache.org/dist/httpd/httpd-2.2.8.tar.gz'
#gzip -d '/usr/local/src/httpd-2.2.8.tar.gz'
tar xvfz httpd-2.2.8.tar.gz
echo "---- go to httpd-2.2.8 ----">>/usr/local/src/ascetic/log.log
cd /usr/local/src/httpd-2.2.8
./configure  --prefix=/usr/local/apache2  --enable-so 
make
make install
mkdir /var/www
mkdir /var/www/public
cd /var/
chmod -c 775 www
cd /var/www
chmod -c 775 public
cp -f /usr/local/src/httpd.conf /usr/local/apache2/conf/httpd.conf
echo "---- END of install apache ----">>/usr/local/src/ascetic/log.log
#--------------------------------------------------------------
# install php 5.2.6
#--------------------------------------------------------------
sudo apt-get install libcurl4-gnutls-dev -y
echo "---- run php5.2.6 installation script ----">>/usr/local/src/ascetic/log.log
cd /usr/local/src
#wget -r -t 3 -O './libxml2-2.8.0.tar.gz'  'ftp://xmlsoft.org/libxml2/libxml2-2.8.0.tar.gz'
tar xvfz libxml2-2.8.0.tar.gz
cd libxml2-2.8.0
 ./configure
make
make install
cd /usr/local/src
#wget -c -t 3 -O './php-5.2.6.tar.gz' 'http://museum.php.net/php5/php-5.2.6.tar.gz'
tar xvfz php-5.2.6.tar.gz
cd php-5.2.6
#./configure --with-apxs2=/usr/local/apache2/bin/apxs --with-mysql=/usr/local/mysql
#./configure --with-apxs2=/usr/local/apache2/bin/apxs --with-mysql=/usr/local/mysql --enable-mbstring --with-mysqli=/usr/local/mysql/bin/mysql_config --with-mysql-sock=/tmp/mysql.sock --with-curl=/usr/local
./configure --with-apxs2=/usr/local/apache2/bin/apxs --with-mysql=/usr/local/mysql --enable-mbstring --with-mysqli=/usr/local/mysql/bin/mysql_config --with-mysql-sock=/tmp/mysql.sock --with-curl=/usr/local --with-pdo-mysql=/usr/local/mysql
make
#make test
make install
echo 'END php5.2.6 installation script! You must check errors!'>>/usr/local/src/ascetic/log.log
