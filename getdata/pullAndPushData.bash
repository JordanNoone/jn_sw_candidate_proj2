#pull data

#push data
while true
do
	curl -i -XPOST 'influxdb:8086/write?db=mydb' --data-binary 'testData value=5'
	sleep 5s
	curl -i -XPOST 'influxdb:8086/write?db=mydb' --data-binary 'testData value=1'
	sleep 5s
done
