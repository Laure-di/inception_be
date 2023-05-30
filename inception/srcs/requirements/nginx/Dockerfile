FROM debian:buster 

RUN apt-get update && apt-get install -y nginx openssl

RUN mkdir /etc/nginx/ssl/ \
&& openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=IledeFrance/L=LParis/O=Ecole/OU=42 Department/CN=www.localhost.com"

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log
    
COPY ./conf/nginx.conf /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]
