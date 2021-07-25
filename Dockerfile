FROM devopsedu/webapp
FROM tomcat
ADD website /var/www/html
CMD "catalina.sh" "run"
CMD apachectl -D FOREGROUND 
