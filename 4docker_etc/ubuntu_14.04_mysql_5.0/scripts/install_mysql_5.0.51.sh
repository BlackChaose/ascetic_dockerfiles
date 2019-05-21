#!/bin/bash
#-------------------------------------------------------------
# for compile
#-------------------------------------------------------------
echo "--- installing libncurses5-dev \n">>/usr/local/src/ascetic/log.log
sudo apt-get install libncurses5-dev -y
echo "--- create group and user mysql \n">>/usr/local/src/ascetic/log.log
#---------------------------------------------------------------
groupadd mysql
useradd -g mysql mysql
#-------------------------------------------------------------
# get tar.gz with sources
#-------------------------------------------------------------
echo "get mysql-5.0.51b.tar.gz \n">>/usr/local/src/ascetic/log.log
cd /usr/local/src
#-------------------------------------------------------------
# uncomment for download source
#-------------------------------------------------------------
#wget -c -t 3 -O ./mysql-5.0.51b.tar.gz http://info.scansend.su/mysql-5.0.51b.tar.gz
echo "extract myqsql-5.0.51b.tar.gz \n">>/usr/local/src/ascetic/log.log
tar xvfz mysql-5.0.51b.tar.gz
cd mysql-5.0.51b
echo "running ./configure \n">>/usr/local/src/ascetic/log.log
./configure --prefix=/usr/local/mysql
echo "running make">>/usr/local/src/ascetic/log.log
make
echo "running make install \n">>/usr/local/src/ascetic/log.log
make install
#-------------------------------------------------------------
# configure cnf, access etc.
#-------------------------------------------------------------
echo "copy file to /etc/my.cnf \n">>/usr/local/src/ascetic/log.log
cp support-files/my-medium.cnf /etc/my.cnf
echo "change access rules \n">>/usr/local/src/ascetic/log.log
cd /usr/local/mysql
chown -R mysql  .
chgrp -R mysql  .
echo "create db \n">>/usr/local/src/ascetic/log.log
bin/mysql_install_db --user=mysql
chown -R root .
chown -R mysql var
#-------------------------------------------------------------
# deprecated: init scripts & aliases
#-------------------------------------------------------------
echo "copy and register init script \n">>/usr/local/src/ascetic/log.log
chmod +x /usr/local/src/ascetic/mysql_server_start.sh
chmod +x /usr/local/src/ascetic/mysql_server_stop.sh
chmod +x /usr/local/src/ascetic/mysqld
cp /usr/local/src/ascetic/mysqld /etc/init.d/
cp /usr/local/src/ascetic/mysql_server_start.sh /usr/local/mysql/bin/
cp /usr/local/src/ascetic/mysql_server_stop.sh /usr/local/mysql/bin/
update-rc.d mysqld defaults
#-------------------------------
echo "writing aliases \n">>/usr/local/src/ascetic/log.log
echo 'alias mysqld=/etc/init.d/mysqld' >> ~/.bashrc 
echo 'alias mysql=/usr/local/mysql/bin/mysql' >> ~/.bashrc
echo 'alias mysqladmin=//usr/local/mysql/bin/mysqladmin'>>~/.bashrc
echo "---- END of install_mysql_5.0.51.hs ----">>/usr/local/src/ascetic/log.log
#---------------------------------------------------------------
# create remote admin for mysql
#---------------------------------------------------------------
echo "add remote admin to mysql">>/usr/local/src/ascetic/log.log
echo "CREATE USER '$MYSQL_REMOTE_ADMIN'@'$MYSQL_RA_IPADDRESS' IDENTIFIED BY '$MYSQL_RA_PASSWORD';">> /usr/local/src/ascetic/sqlremoteuser.sql
echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_REMOTE_ADMIN'@'$MYSQL_RA_IPADDRESS';">> /usr/local/src/ascetic/sqlremoteuser.sql
/usr/local/mysql/bin/mysqld_safe --user=mysql &
/usr/local/mysql/bin/mysql -uroot mysql < /usr/local/src/ascetic/sqlremoteuser.sql
echo "END of add remote admin to mysql">>/usr/local/src/ascetic/log.log
#---------------------------------------------------------------
exit 0