FROM devopsedu/webapp
ADD website /var/www/html
RUN apt-get update &&\
    apt-get install -y \
    software-properties-common \
    vim \
    unzip \
    curl &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/*

# Install Apache and PHP with extensions
RUN apt-get update &&\
    apt-get install -y \
    libapache2-mod-php7.0 \
    apache2 \
    php7.0 \
    php7.0-mysqli \
    php-mongodb \
    php7.0-gd \
    php7.0-curl \
    php7.0-dom \
    php7.0-zip \
    php7.0-mbstring &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/* &&\
    ln -sf /dev/stdout /var/log/apache2/access.log &&\
    ln -sf /dev/stdout /var/log/apache2/other_vhosts_access.log &&\
    ln -sf /dev/stderr /var/log/apache2/error.log &&\
    chown -R www-data:www-data /var/log/apache2 &&\
    sed -i 's/\;error_log = php_errors\.log/error_log = \/dev\/stderr/g' /etc/php/7.0/apache2/php.ini &&\
    cat /etc/php/7.0/apache2/php.ini | grep error_log
RUN rm /var/www/html/index.html
CMD apachectl -D FOREGROUND 
