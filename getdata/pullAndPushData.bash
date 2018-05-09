#pull data
#push data
while true
do
	nf=$(curl -s https://twitter.com/elonmusk | grep -o '[0-9,]* Followers')
	nf_trimmed=$(tr -dc '0-9' <<< $nf)
	echo $nf_trimmed
	curl -i -XPOST 'influxdb:8086/write?db=mydb' --data-binary 'testData value='$nf_trimmed
	sleep 5s
done
