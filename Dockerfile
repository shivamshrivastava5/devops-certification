FROM devopsedu/webapp
FROM tomcat
ADD website /var/www/html
EXPOSE 8181
CMD "catalina.sh" "run"
CMD apachectl -D FOREGROUND 
