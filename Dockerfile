FROM devopsedu/webapp
RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get install -y apache2-utils
    libapache2-mod-php7.0 \
    apache2 \
    php7.0 \
    apt-get clean
    apt-get upgrade -y
    cat /etc/php/7.0/apache2/php.ini | grep error_log
ADD website /var/www/html
EXPOSE 8181
CMD ["apache2ctl", "-D","FOREGROUND"]
