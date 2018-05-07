#!/bin/bash
# Install Docker

# Install InfluxDB
docker run --name influxdb -d -p 8086:8086 -p 25826:25826/udp -v $PWD/influxdb:/var/lib/influxdb influxdb
# Configure InfluxDB

# Install Grafana
docket run --name grafana -d -p 3000:3000 -v $PWD/grafana:/var/lib/grafana --link influxdb grafana/grafana
# Configure Grafana
