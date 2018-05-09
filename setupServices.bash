#!/bin/bash
# Grant Permission to git repo
chmod -R a+rw ~/jn_sw_candidate_proj2/grafana/
chmod -R a+rw ~/jn_sw_candidate_proj2/influxdb/

# Clear Containers
docker kill influxdb
docker rm influxdb
docker kill grafana
docker rm grafana
docker kill getData
docker rm getData

# Install Docker

# Install InfluxDB
docker run --name influxdb -d -p 8086:8086 -p 25826:25826/udp -v ~/influxdb:/var/lib/influxdb -v ~/jn_sw_candidate_proj2/influxdb/etc:/etc/influxdb/:rw influxdb
# Configure InfluxDB
sleep .5 
docker exec influxdb bash -c "influx -execute 'CREATE DATABASE mydb'"

# Install & Configure Grafana
docker run --name grafana -d -p 3000:3000 -v ~/jn_sw_candidate_proj2/grafana/etc:/etc/grafana/:rw -v ~/jn_sw_candidate_proj2/grafana/dashboards:/var/lib/grafana/dashboards/ --link influxdb grafana/grafana

# Build getData
cd ~/jn_sw_candidate_proj2/getdata
sudo docker build -t getdata:0.1 .
cd ~
# Run getData
sudo docker run --name getData --link influxdb -d getdata:0.1 bash
sudo docker exec getData "curl -i -XPOST 'influxdb:8086/write?db=mydb' --data-binary 'testData value=5'"
sleep 5s
sudo docker exec getData "curl -i -XPOST 'influxdb:8086/write?db=mydb' --data-binary 'testData value=10'"
sleep 5s
sudo docker exec getData "curl -i -XPOST 'influxdb:8086/write?db=mydb' --data-binary 'testData value=1'"

# Push Sample Data

