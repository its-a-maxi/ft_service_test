FROM alpine:3.12

# Installation of packages
RUN apk add influxdb

# Initialize influxdb
COPY influxdb_run.sh ./influxdb_run.sh
RUN chmod +x /influxdb_run.sh
CMD sh ./influxdb_run.sh

