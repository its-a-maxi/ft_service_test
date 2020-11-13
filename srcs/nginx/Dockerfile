FROM alpine

# Installation of packages
RUN apk update
RUN apk add openrc --no-cache
RUN apk add nginx
RUN apk add openssl
RUN apk add openssh

# User declaration
RUN adduser -D -g 'www' www

# Generate key and crt
RUN adduser -D user
RUN echo "user:password" | chpasswd
RUN ssh-keygen -A
RUN yes "" | openssl req -x509 -nodes -days 365 \
-subj "/C=SP/ST=Spain/L=Madrid/O=42/CN=127.0.0.1" \
-newkey rsa:2048 \
-keyout /etc/ssl/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.crt

# Setup nginx files
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir -p /run/nginx

# Cpy configuration for nginx and for our webpage
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/index.html

# Run the executable to inicialize nginx
COPY nginx_run.sh ./nginx_run.sh
RUN chmod +x /nginx_run.sh
CMD sh ./nginx_run.sh

# Expose the following ports for other docker images?
EXPOSE 80 443 22