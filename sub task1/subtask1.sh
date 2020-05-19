#!bin/sh
sudo apt-get install apache2
sudo ufw allow 'Apache'
sudo systemctl enable apache2.service
sudo a2enmod userdir
sudo mkdir /var/www/soldier.io
sudo mkdir /var/www/soldier.io/html
touch /var/www/soldier.io/html/index.html
echo "<html>
<head>
<title>Welcome to the page soldier.io!</title>
</head>
<body>
       " > /var/www/soldier.io/html/index.html
for i in {1..50}
do
echo " <h1>Army$i</h1>
<a href="/~Army$i/index.html">Army$i profile</a>
   " >> /var/www/soldier.io/html/index.html
done

for i in {1..50}
do
echo " <h1>Navy$i</h1>
<a href="/~Navy$i/index.html">Navy$i profile</a>
   " >> /var/www/soldier.io/html/index.html
done
for i in {1..50}
do
echo " <h1>AirForce$i</h1>
<a href="/~AirForce$i/index.html">AirForce$i profile</a>
   " >> /var/www/soldier.io/html/index.html
done 
echo "</body>
</html>" >> /var/www/soldier.io/html/index.html
sudo touch /etc/apache2/sites-available/soldier.io.conf
sudo touch /etc/apache2/sites-available/soldier.io.conf
sudo chmod 777 /etc/apache2/sites-available/soldier.io.conf
echo "<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    ServerName soldier.io
    ServerAlias soldier.io
    DocumentRoot /var/www/soldier.io/html
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" > /etc/apache2/sites-available/soldier.io.conf
sudo chmod 644 /etc/apache2/sites-available/soldier.io.conf
sudo a2ensite soldier.io
sudo a2dissite 000-default.conf
sudo a2enmod rewrite
sudo systemctl restart apache2
sudo chmod 777 /etc/apache2/apache2.conf
echo "
<Directory /var/www/soldier.io/html/>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
</Directory> " >> /etc/apache2/apache2.conf
sudo chmod 644 /etc/apache2/apache2.conf
echo "RewriteEngine on
RewriteCond "%{HTTP_USER_AGENT}"  "*USER-AGENT.*"
RewriteRule "^/html$"         "attendance.html"          [L]

RewriteRule "^/html$"         "index.html"          [L]
 " >> /var/www/soldier.io/.htaccess
sudo systemctl restart apache2
touch /var/www/soldier.io/html/attendance.html
echo "$(crontab -l ; echo  '1 0 * * * cat /home/CheifCommander/attendance_report.txt > /var/www/soldier.io/html/attendance.html')" | crontab - 
 



