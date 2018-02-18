#!/bin/bash

# Setup xdebug
mkdir -p /tmp/xdebug/profiler && chmod -R 664 /tmp/xdebug/profiler
touch /tmp/xdebug/xdebug.log && chmod 664 /tmp/xdebug/xdebug.log
sed -i  "s/{XDEBUG_REMOTE_HOST}/$XDEBUG_REMOTE_HOST/g" /root/xdebug.ini

# Copy config files
cp /root/httpd.conf /etc/httpd/conf/httpd.conf
cp /root/xdebug.ini /etc/php.d/xdebug.ini

# Set timezone
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime

# Start memcached
/usr/bin/memcached -u memcached -p 11211 -m 128 -c 1024 &

# Start httpd
/usr/sbin/apachectl -DFOREGROUND
