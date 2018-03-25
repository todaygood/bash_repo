#!/usr/bin/env bash


echo "for .. in together with $()" 
for p in $(ls *.sh)
do 
	echo $p  
done 

echo "------------------------------"
echo "for i++"
for ((i=0; i<10; i++))
do 
	echo $i 

done


echo "------------------------------"
echo "for i++"
for i in $(seq 10) 
do 
	echo $i
done

echo "------------------------------"
echo "for i+2"
for i in $(seq 0 2 10) 
do 
	echo $i
done

echo "------------------------------"
echo "for in {}"
for i in {1..10}
do 
	echo $i
done
