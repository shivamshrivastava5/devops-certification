FROM devopsedu/webapp
FROM ubuntu/apache2
ADD website /var/www/html
RUN rm /var/www/html/index.html
CMD apachectl -D FOREGROUND 
