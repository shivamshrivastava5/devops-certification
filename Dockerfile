FROM devopsedu/webapp
FROM tomcat
ADD website /var/www/html
RUN rm /var/www/html/index.html
CMD "catalina.sh" "run"
CMD apachectl -D FOREGROUND 
