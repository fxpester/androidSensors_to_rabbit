# androidSensors_to_rabbit   
Thisi is bash script that sends Android sensors data to RabbitMQ server by http REST API.   

# prereqs:   
1) on you android device you should install sensoduino (use google play store)   
2) enable API on RabbitMQ    

# description:   
Sensoduino reads sensor data and save it in file, this script read that data and pass it to rabbitmq by wget POST requests. 
