#!/usr/bin/env bash

if [ $# -ne 2 ] 
then 
	echo "Usage: $0 server_ipaddr server_port"	
	exit 1
fi 

for ((i=$2; i<$2+6; i++))
do
	iperf3 -c $1 -p $i -t 600 > /dev/null &
done


