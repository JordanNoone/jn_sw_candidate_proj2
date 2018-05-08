#!/bin/bash
# Clear Containers
sudo docker rm $(sudo docker ps -aq)

# Install Docker

# Install InfluxDB
docker run --name influxdb -d -p 8086:8086 -p 25826:25826/udp -v ~/influxdb:/var/lib/influxdb -v ~/jn_sw_candidate_proj2/influxdb/influxdb.conf:/etc/influxdb/influxdb.conf:ro influxdb
# Configure InfluxDB

# Install Grafana
docker run --name grafana -d -p 3000:3000 -v ~/grafana:/var/lib/grafana -v ~/jn_sw_candidate_proj2/grafana/grafana.ini:/etc/grafana/grafana.ini:ro --link influxdb grafana/grafana
# Configure Grafana
