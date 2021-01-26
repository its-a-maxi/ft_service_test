FROM alpine:3.12

# Installation of packages
RUN apk update
RUN apk add vsftpd openssl

# Generate key and crt
RUN { echo "password"; echo "password"; } | adduser user
RUN openssl req -x509 -nodes -days 365 \
	-newkey rsa:2048 -subj "/C=SP/ST=Spain/L=Madrid/O=42/CN=127.0.0.1" \
	-keyout /etc/ssl/private/ftps-selfsigned.key \
	-out /etc/ssl/certs/ftps-selfsigned.crt

# Setup ftp configuration file
COPY ./vsftpd.conf /srcs/

# Initialize ftps
COPY run.sh ./run.sh
RUN chmod +x /run.sh
CMD sh ./run.sh

# Expose port 21 for ftps comunication
EXPOSE 21 30021
