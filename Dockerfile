FROM devopsedu/webapp
RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get install -y apache2-utils
RUN apt-get clean
RUN apt-get upgrade -y
ADD website /var/www/html
EXPOSE 8181
CMD ["apache2ctl", "-D","FOREGROUND"]
