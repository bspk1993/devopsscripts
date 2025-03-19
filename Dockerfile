FROM ubuntu
RUN apt update -y
RUN apt install apache2 -y
RUN apt install apache2-utils -y
RUN apt clean
COPY website/ /var/www/html/
RUN service apache2 restart
EXPOSE 80
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

docker build -t firstproject:v1 .

docker run -it -d --name newwebsitecont1 -p 80:80 firstproject:v1
