FROM alpine:3.12

# Installation of packages
RUN apk update && \
	apk upgrade && \
	apk add wget bash libc6-compat && \
	wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.2_linux_amd64.tar.gz && \
	tar -xzf telegraf-1.15.2_linux_amd64.tar.gz && \
	mv /telegraf-1.15.2	/etc/ && \
	rm -rf telegraf-1.15.2_linux_amd64.tar.gz

# Setup configuration
COPY ./srcs /etc/telegraf-1.15.2/etc/telegraf

# Initialize telegraf
WORKDIR /etc/telegraf-1.15.2/usr/bin
ENTRYPOINT	["./telegraf"]
CMD ["--config", "/etc/telegraf-1.15.2/etc/telegraf/telegraf.conf"]
