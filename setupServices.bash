#!/bin/bash
# Grant Permission to git repo
chmod -R a+rw ~/jn_sw_candidate_proj2/grafana/
chmod -R a+rw ~/jn_sw_candidate_proj2/influxdb/


# Clear Containers
docker kill influxdb
docker rm influxdb
docker kill grafana
docker rm grafana

# Install Docker

# Install InfluxDB
docker run --name influxdb -d -p 8086:8086 -p 25826:25826/udp -v ~/influxdb:/var/lib/influxdb -v ~/jn_sw_candidate_proj2/influxdb/etc:/etc/influxdb/:rw influxdb
# Configure InfluxDB

# Install Grafana
docker run --name grafana -d -p 3000:3000 -v ~/jn_sw_candidate_proj2/grafana/etc:/etc/grafana/:rw --link influxdb grafana/grafana
# Configure Grafana
