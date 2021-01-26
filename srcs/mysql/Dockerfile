FROM alpine:3.12

COPY ./srcs /srcs

# Installation of packages
RUN apk update
RUN apk add mariadb mariadb-client

# Setup mysql configuration
COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
RUN	mkdir -p /run/mysqld/ && chmod +x /srcs/load_bd.sh

# Expose mysql port
EXPOSE 3306

# Start mysql
ENTRYPOINT mariadb-install-db --user=root --datadir="/var/lib/mysql" && \
			mariadbd-safe --user=root --datadir="/var/lib/mysql/"
