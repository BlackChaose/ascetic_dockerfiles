*** CheetSheet for configure multiply php version with old tehnology - cgi ***

1) Get & Compile & Build php5.3
```shell script

```
2) Get & Compile & Build php7.2
```shell script

```
2*) To get PHP to handle PATH_INFO and PATH_TRANSLATED information correctly with this setup, the PHP parser should be compiled with the --enable-discard-path configure option.

3) Configure ScriptAliase's: php5.3-cgi & php7.2-cgi in path /usr/lib/cgi-bin/

file "php5.3-cgi"

```shell script
#!/bin/sh
PHPRC="/opt/php5.3/"
export PHPRC
PHP_FCGI_CHILDREN=4
export PHP_FCGI_CHILDREN
PHP_FCGI_MAX_REQUESTS=5000
export PHP_FCGI_MAX_REQUESTS
export PDFLIBLICENSEFILE=/etc/pdflib/license
exec /opt/php5.3/bin/php-cgi
```
file "php7.2-cgi"

```shell script
#!/bin/sh
PHPRC="/opt/php7.2/etc"
export PHPRC
PHP_FCGI_CHILDREN=4
export PHP_FCGI_CHILDREN
PHP_FCGI_MAX_REQUESTS=5000
export PHP_FCGI_MAX_REQUESTS
exec /opt/php7.2/bin/php-cgi
```

4) Add rights to files "php5.3-cgi" & "php7.2-cgi" root:root 755

```shell script
    sudo chown root:root /usr/lib/cgi-bin/php5.3-cgi
    sudo chmod 755 /usr/lib/cgi-bin/php5.3-cgi
    sudo chown root:root /usr/lib/cgi-bin/php7.2-cgi
    sudo chmod 755 /usr/lib/cgi-bin/php7.2-cgi

```
5) Enable mods in Apache2: 
```shell script
    sudo a2enmod actions
    sudo a2enmod cgi

```

6) Change virtual host conf, for example: /etc/apache2/sites-available/000-default.conf:

```apacheconfig
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html

	    <Directory /var/www/html>
                Options Indexes FollowSymLinks
                AllowOverride all
        </Directory>

        ErrorLog /var/log/apache2/error_log
        TransferLog /var/log/apache2/access_log
		<FilesMatch "\.php">
			SetHandler application/x-httpd-php53
		</FilesMatch>

		ScriptAlias /php53-cgi /usr/lib/cgi-bin/php53-cgi
		Action application/x-httpd-php53 /php53-cgi
		AddHandler application/x-httpd-php53 .php

</VirtualHost>

```
7) if your want use this method for other many sites, you may use options Include
for example, in 000-default.conf
```apacheconfig
 <VirtualHost *:80>
         ServerAdmin webmaster@localhost
         DocumentRoot /var/www/html
 
 	    <Directory /var/www/html>
                 Options Indexes FollowSymLinks
                 AllowOverride all
         </Directory>
 
         ErrorLog /var/log/apache2/error_log
         TransferLog /var/log/apache2/access_log
         
         #---------#
         # See Here!
         #---------#
         
         Options +Includes
         Include php5.3.conf
 
 </VirtualHost>
```
and put to /etc/apache2/php5.3.conf
```apacheconfig
 
<FilesMatch "\.php">
SetHandler application/x-httpd-php5
</FilesMatch>
ScriptAlias /php53-cgi /usr/lib/cgi-bin/php53-cgi
Action application/x-httpd-php53 /php53-cgi
AddHandler application/x-httpd-php53 .php
```
and put to /etc/apache2/php7.2.conf
```apacheconfig
<FilesMatch "\.php">
SetHandler application/x-httpd-php7
</FilesMatch>
ScriptAlias /php72-cgi /usr/lib/cgi-bin/php72-cgi
Action application/x-httpd-php7 /php72-cgi
#AddHandler application/x-httpd-php7 .php
```
