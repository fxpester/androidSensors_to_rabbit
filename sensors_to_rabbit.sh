echo "" > /sdcard/sensoduino.txt
sleep 30


magnet_x=`grep -A 8 -m 1 GPS1  /sdcard/sensoduino.txt | grep Magnet |sed s/,/\ /g| awk '{print $3}'`
magnet_y=`grep -A 8 -m 1 GPS1  /sdcard/sensoduino.txt | grep Magnet |sed s/,/\ /g| awk '{print $4}'`
magnet_z=`grep -A 8 -m 1 GPS1  /sdcard/sensoduino.txt | grep Magnet |sed s/,/\ /g| awk '{print $5}'`


lat=`grep -A 8 -m 1 GPS1  /sdcard/sensoduino.txt | grep GPS1 | awk '{print $3}'| sed s/,//`
long=`grep -A 8 -m 1 GPS1  /sdcard/sensoduino.txt | grep GPS1 | awk '{print $4}'| sed s/,//`
alt=`grep -A 8 -m 1 GPS1  /sdcard/sensoduino.txt | grep GPS1 | awk '{print $5}'| sed s/,//`
speed=`grep -A 8 -m 1 GPS1  /sdcard/sensoduino.txt | grep GPS1 | awk '{print $6}'| sed s/,//`

audio1=`grep -A 8 -m 1 GPS1  /sdcard/sensoduino.txt | grep Audio | sed s/,/\ /g| awk '{print $3}'`
audio2=`grep -A 8 -m 1 GPS1  /sdcard/sensoduino.txt | grep Audio | sed s/,/\ /g| awk '{print $4}'`


wget -q -O /dev/null --header="Content-Type:application/json" --post-data="{\"properties\":{},\"routing_key\":\"amq.topic\",\"payload\":\"{\\\"magnet_x\\\":\\\"$magnet_x\\\"}\",\"payload_encoding\":\"string\"}" http://guest:guest@192.168.1.33:15672/api/exchanges/%2f/amq.topic/publish
wget -q -O /dev/null --header="Content-Type:application/json" --post-data="{\"properties\":{},\"routing_key\":\"amq.topic\",\"payload\":\"{\\\"magnet_y\\\":\\\"$magnet_y\\\"}\",\"payload_encoding\":\"string\"}" http://guest:guest@192.168.1.33:15672/api/exchanges/%2f/amq.topic/publish
wget -q -O /dev/null --header="Content-Type:application/json" --post-data="{\"properties\":{},\"routing_key\":\"amq.topic\",\"payload\":\"{\\\"magnet_z\\\":\\\"$magnet_z\\\"}\",\"payload_encoding\":\"string\"}" http://guest:guest@192.168.1.33:15672/api/exchanges/%2f/amq.topic/publish

wget -q -O /dev/null --header="Content-Type:application/json" --post-data="{\"properties\":{},\"routing_key\":\"amq.topic\",\"payload\":\"{\\\"Audio1\\\":\\\"$audio1\\\"}\",\"payload_encoding\":\"string\"}" http://guest:guest@192.168.1.33:15672/api/exchanges/%2f/amq.topic/publish
wget -q -O /dev/null --header="Content-Type:application/json" --post-data="{\"properties\":{},\"routing_key\":\"amq.topic\",\"payload\":\"{\\\"Audio2\\\":\\\"$audio2\\\"}\",\"payload_encoding\":\"string\"}" http://guest:guest@192.168.1.33:15672/api/exchanges/%2f/amq.topic/publish

wget -q -O /dev/null --header="Content-Type:application/json" --post-data="{\"properties\":{},\"routing_key\":\"amq.topic\",\"payload\":\"{\\\"Latitude\\\":\\\"$lat\\\"}\",\"payload_encoding\":\"string\"}" http://guest:guest@192.168.1.33:15672/api/exchanges/%2f/amq.topic/publish
wget -q -O /dev/null --header="Content-Type:application/json" --post-data="{\"properties\":{},\"routing_key\":\"amq.topic\",\"payload\":\"{\\\"Longtitude\\\":\\\"$long\\\"}\",\"payload_encoding\":\"string\"}" http://guest:guest@192.168.1.33:15672/api/exchanges/%2f/amq.topic/publish
wget -q -O /dev/null --header="Content-Type:application/json" --post-data="{\"properties\":{},\"routing_key\":\"amq.topic\",\"payload\":\"{\\\"Altitude\\\":\\\"$alt\\\"}\",\"payload_encoding\":\"string\"}" http://guest:guest@192.168.1.33:15672/api/exchanges/%2f/amq.topic/publish
wget -q -O /dev/null --header="Content-Type:application/json" --post-data="{\"properties\":{},\"routing_key\":\"amq.topic\",\"payload\":\"{\\\"Speed\\\":\\\"$speed\\\"}\",\"payload_encoding\":\"string\"}" http://guest:guest@192.168.1.33:15672/api/exchanges/%2f/amq.topic/publish
