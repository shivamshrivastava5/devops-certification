FROM devopsedu/webapp
RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get install -y apache2-utils
RUN apt-get clean
RUN apt-get upgrade -y
RUN chown -R www-data:www-data /var/log/apache2 &&\
RUN cat /etc/php/7.0/apache2/php.ini | grep error_log
ADD website /var/www/html
EXPOSE 8181
CMD ["apache2ctl", "-D","FOREGROUND"]
