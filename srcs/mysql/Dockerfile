FROM alpine

COPY ./srcs /srcs

# Installation of packages
RUN apk update
RUN apk add mariadb mariadb-client


COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

RUN	mkdir -p /run/mysqld/ && chmod +x /srcs/load_bd.sh	
EXPOSE 3306

ENTRYPOINT mariadb-install-db --user=root --datadir="/var/lib/mysql" && \
			mariadbd-safe --user=root --datadir="/var/lib/mysql/"
