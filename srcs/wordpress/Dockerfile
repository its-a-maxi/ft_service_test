FROM alpine:3.12

# Installation of packages
RUN apk update
RUN apk add php7 php7-fpm php7-mbstring php7-mysqli php7-json

# Installation of wordpress
RUN mkdir -p /www/wordpress/
RUN wget https://es.wordpress.org/latest-es_ES.tar.gz -P /www/wordpress/
RUN tar xzvf /www/wordpress/latest-es_ES.tar.gz -C /www/
RUN rm -rf /www/wordpress/latest-es_ES.tar.gz

# Setup wordpress configuration file
COPY wp-config.php /www/wordpress/wp-config.php

# Initialize wordpress
COPY wordpress_run.sh ./wordpress_run.sh
RUN chmod +x /wordpress_run.sh
CMD sh ./wordpress_run.sh

