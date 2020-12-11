FROM alpine

# Installation of packages
RUN apk update
RUN apk add phpmyadmin

# Setup configuration file for phpmyadmin
COPY config.inc.php /etc/phpmyadmin/config.inc.php

# Initialize phpmyadmin
COPY phpmyadmin_run.sh ./phpmyadmin_run.sh
RUN chmod +x /phpmyadmin_run.sh
CMD sh ./phpmyadmin_run.sh

# Expose phpadmin port
EXPOSE 5000
