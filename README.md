# Dockerfile to host Apache 2.4 and PHP 5.6 on CentOS 7 #

### Dockerfile includes following components ###

* Apache 2.4.6
* PHP 5.6.33
* OpenSSL 1.0.2k
* Memcached 1.4.15
* PHP Extensions
  * php56w
  * php56w-common
  * php56w-devel
  * php56w-gd
  * php56w-pdo
  * php56w-cli
  * php56w-bcmath
  * php56w-mysql
  * php56w-curl
  * php56w-mcrypt
  * php56w-pecl-memcache
  * php56w-pecl-memcached
  * php56w-pecl-xdebug
  * mongo

### Usage ###

* Pull docker image from docker hub:
  * docker pull rdbagga/centos7-apache24-php56

* Create docker container:
  * docker run -d -v /var/www/html:/var/www/html -p 0.0.0.0:80:80 -v /tmp/xdebug:/tmp/xdebug --env XDEBUG_REMOTE_HOST=<XDEBUG_REMOTE_HOST> rdbagga/centos7-apache24-php56

Note: <XDEBUG_REMOTE_HOST> - Replace it with docker host machine IP address
