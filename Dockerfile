# CentOS 7
FROM centos:centos7

# Update repo
RUN yum -y update && \
	yum -y install https://mirror.webtatic.com/yum/el7/webtatic-release.rpm && \
	yum clean all

# Install default packages
RUN yum -y install \
	openssl \
	gcc make openssl-devel \
	curl && \
	yum clean all

# Install Apache, MariaDB, PHP-5.6, Memcached packages
RUN yum -y install \
	libmemcached \
	memcached \
	httpd \
	mariadb.x86_64 \
	php56w \
	php56w-common \
	php56w-devel \
	php56w-gd \
	php56w-pdo \
	php56w-cli \
	php56w-bcmath \
	php56w-mysql \
	php56w-curl \
	php56w-mcrypt \
	php56w-pecl-memcache \
	php56w-pecl-memcached \
	php56w-pecl-xdebug && \
	yum clean all && \
	rm -rf /var/cache/yum/*

# Install pecl mongo
RUN pecl install mongo && \
	echo "extension=mongo.so" > /etc/php.d/mongo.ini

# Define environment variables
ENV TZ="Asia/Kolkata"

# Expose port for container
EXPOSE 80 3306 9001 27017

# Define volume for container
VOLUME ["/var/www/html", "/tmp/xdebug"]

# Copy setup and config files
COPY include/setup.sh /root/setup.sh
COPY include/conf.d/* /root/

# Execute script in container
CMD sh /root/setup.sh
