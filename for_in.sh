#!/usr/bin/env bash

echo "for .. in with strings variable separted by blank"
SERVICES="80   22   25   110   8000   23   20   21   3306   " 
for port in $SERVICES
do 
	echo $port 
done


echo "for .. in with string separted by blank"
for port in 80 22 25 
do 
	echo $port
done 


echo "use * stands for a set" 
for script in *.sh
do 
	ls -al $script
done 



