#!/usr/bin/env bash

if [ $# -ne 2 ] 
then 
	echo "Usage: $0 ip1 ip2"
	exit 1 
fi 

host1=$1
host2=$2

ssh $host1 netserver.sh 12000
ssh $host2 netserver.sh 13000

ssh $host1 netperf.sh $host2 13000
ssh $host2 netperf.sh $host1 12000


