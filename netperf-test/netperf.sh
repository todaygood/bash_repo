#!/usr/bin/env bash

if [ $# -ne 2 ] 
then 
	echo "Usage: $0 server_ipaddr server_port"	
	exit 1
fi 

for ((i=$2; i<$2+100; i++))
do
	netperf -H $1 -p $i -l 600 &
done


