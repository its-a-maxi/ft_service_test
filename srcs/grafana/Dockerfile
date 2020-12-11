FROM alpine

COPY ./srcs /srcs

RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat && \
	chmod +x /srcs/grafana-7.1.2/bin/grafana-server

EXPOSE 3000

WORKDIR /srcs/grafana-7.1.2/bin/

CMD ./grafana-server


