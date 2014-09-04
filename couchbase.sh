# Install libcouchbase
wget -O/etc/apt/sources.list.d/couchbase.list http://packages.couchbase.com/ubuntu/couchbase-ubuntu1404.list
wget -O- http://packages.couchbase.com/ubuntu/couchbase.key | sudo apt-key add -

apt-get update
apt-get install libcouchbase2-libevent libcouchbase-dev

# Install couchbase php extension
apt-get install build-essential
apt-get install php-pear

pecl install couchbase

# Add module to php
php5enmod http

# Restart all the things
service nginx restart
service php5-fpm restart
