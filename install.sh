sudo apt update
sudo apt install -y postgresql apache2 apt-transport-https certbot python3-certbot-apache fontconfig
sudo a2enmod proxy_http
sudo a2enmod rewrite
sudo vim /etc/apache2/sites-available/confluence.heyvaldemar.net.conf
sudo vim /etc/apache2/sites-available/confluence.heyvaldemar.net-ssl.conf
sudo a2ensite confluence.heyvaldemar.net.conf
sudo a2ensite confluence.heyvaldemar.net-ssl.conf
sudo a2dissite 000-default.conf
sudo apache2ctl configtest
sudo systemctl restart apache2
sudo systemctl status apache2
sudo certbot --apache -d confluence.heyvaldemar.net
sudo certbot renew --dry-run
sudo su - postgres
psql
CREATE USER confluencedbuser WITH PASSWORD '2n!sfa@423FdsC0fH$vL';
CREATE DATABASE "confluencedb" WITH OWNER "confluencedbuser" ENCODING 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8' TEMPLATE template0 CONNECTION LIMIT = -1;
\q
exit

wget https://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-7.12.0-x64.bin
sudo chmod a+x atlassian-confluence-7.12.0-x64.bin
sudo ./atlassian-confluence-7.12.0-x64.bin

sudo vim /opt/atlassian/confluence/conf/server.xml
sudo /etc/init.d/confluence start
sudo less /opt/atlassian/confluence/logs/catalina.out
