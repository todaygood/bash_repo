#!/usr/bin/env bash

if [ $# -lt 0 ] 
then 
	echo "Usage: $0 pa1 pa2"
fi 

echo "loop each parameter"
for p in $*
do 
	echo $p --
done 
