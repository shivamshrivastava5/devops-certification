FROM devopsedu/webapp
FROM tomcat
RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get install -y apache2-utils
RUN apt-get clean
RUN apt-get upgrade -y
ADD website /var/www/html
EXPOSE 8181
CMD "catalina.sh" "run"
CMD ["apache2ctl", "-D","FOREGROUND"]
