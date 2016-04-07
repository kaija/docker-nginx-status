FROM ubuntu:latest

MAINTAINER Kaija Chang "kaija.chang@gmail.com"

RUN apt-get update && apt-get install -y nginx

ADD templates/default /etc/nginx/sites-available/default

EXPOSE 80 443 8080

CMD ["nginx", "-g", "daemon off;"]
