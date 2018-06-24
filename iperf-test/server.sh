#!/usr/bin/env bash

if [ $# -ne 1 ] 
then 
	echo "Usage: $0 listen_port" 
	exit 1
fi 

for ((i=$1;i<$1+1; i++))
do 
	iperf3 -s -D -p $i 
done
