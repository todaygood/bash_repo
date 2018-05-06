#!/usr/bin/env bash

if [ $# -ne 1 ] 
then 
	echo "Usage: $0 listen_port" 
	exit 1
fi 

for ((i=$1;i<$1+100; i++))
do 
	netserver -p $i
done
