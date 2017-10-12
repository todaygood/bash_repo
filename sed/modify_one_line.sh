#!/usr/bin/env
################################
#Change the following line from 
#ExecStart=/usr/bin/dockerd
# to  
#ExecStart=/usr/bin/dockerd --insecure-registry  10.54.12.2:5000 --bip 10.53.128.1/24
###############################

FILE=/usr/lib/systemd/system/docker.service
line=$(sed -n -e '/dockerd/=' $FILE)
sed  -i "$line d" $FILE
sed  -i "$line a ExecStart=/usr/bin/dockerd --insecure-registry  192.168.63.246:5000 --bip 10.53.128.1/24 " $FILE

