FROM alpine

# Installation of grafana
COPY ./srcs /srcs
RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat && \
	chmod +x /srcs/grafana-7.1.2/bin/grafana-server

# Expose Grafana port
EXPOSE 3000

# Initialize Grafana
WORKDIR /srcs/grafana-7.1.2/bin/
CMD ./grafana-server


