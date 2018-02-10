# Dockerfile to host LAMP stack on CentOS 7 #

### Dockerfile includes following components ###

* Apache
* MariaDB
* PHP 5.6
* Memcached
* OpenSSL
* PHP Extensions
  * php56-common
  * php56-devel
  * php56-gd
  * php56-pdo
  * php56-cli
  * php56-bcmath
  * php56-mysql
  * php56-curl
  * php56-mcrypt
  * php56-pecl-memcache
  * php56-pecl-memcached
  * php56-pecl-xdebug
  * mongo

### Usage ###

* Pull docker LAMP image from docker hub:
  * docker pull rdbagga/docker-lamp-centos7:php5.6
* Create docker container using docker LAMP image:
  * docker run -d -v /var/www/html:/var/www/html -p 0.0.0.0:80:80 -v /tmp/xdebug:/tmp/xdebug --env DOCKER_HOST_IP=<DOCKER_HOST_IP> rdbagga/docker-lamp-centos7:php5.6

Note: <DOCKER_HOST_IP> - Replace it with your IP address
