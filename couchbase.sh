# Install libcouchbase
sudo wget -O/etc/apt/sources.list.d/couchbase.list http://packages.couchbase.com/ubuntu/couchbase-ubuntu1404.list
sudo wget -O- http://packages.couchbase.com/ubuntu/couchbase.key | sudo apt-key add -

sudo apt-get update
sudo apt-get install libcouchbase2-libevent libcouchbase-dev

# Install couchbase php extension
dpkg -s php-pear
PEAR_IS_INSTALLED=$?

dpkg -s php5-dev
PHPDEV_IS_INSTALLED=$?

if [ ${PEAR_IS_INSTALLED} -eq 1 ]; then
        sudo apt-get -qq install php-pear
    fi

    if [ ${PHPDEV_IS_INSTALLED} -eq 1 ]; then
        sudo apt-get -qq install php5-dev
    fi
fi

sudo apt-get install php-pear

sudo pecl install couchbase

sudo cat > /etc/php5/mods-available/couchbase.ini << EOF
; configuration for php couchbase module
; priority=30
extension=couchbase.so
EOF

# Add module to php
sudo php5enmod http

# Restart all the things
sudo service nginx restart
sudo service php5-fpm restart
