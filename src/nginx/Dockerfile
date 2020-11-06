FROM alpine

# Installation of packages
RUN apk update
RUN apk add openrc --no-cache
RUN apk add nginx

# User declaration
RUN adduser -D -g 'www' www

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
EXPOSE 80
EXPOSE 443