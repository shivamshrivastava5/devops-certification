FROM devopsedu/webapp
RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get install -y apache2-utils
RUN rm /var/www/html/index.html
ADD website /var/www/html
CMD ["apache2ctl", "-D","FOREGROUND"]
