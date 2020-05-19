#!/bin/sh
sudo a2enmod proxy
sudo a2enmod proxy_http
sudo a2enmod proxy_balancer
sudo a2enmod lbmethod_byrequests
sudo chmod 777 /etc/apache2/sites-available/soldier.io.conf
sudo echo " <VirtualHost *:80>
    ServerAdmin sibtain@soldier.io
    ProxyRequests off
    DocumentRoot /var/www/soldier.io/html
    ProxyPreserveHost On 

    ServerName soldier.io
    ServerAlias www.soldier.io

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
    LogLevel error

    <Location />
        ProxyPass http://localhost:3333/
        ProxyPassReverse http://localhost:3333/
        Order allow,deny
        Allow from all
    </Location>

</VirtualHost> " > /etc/apache2/sites-available/soldier.io.conf
sudo chmod 644 /etc/apache2/sites-available/soldier.io.conf
sudo service apache2 reload

