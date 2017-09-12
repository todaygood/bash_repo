#!/bin/bash
dd if=/dev/zero of=/dev/null count=1000000000000 &
dd if=/dev/zero of=/dev/null count=1000000000000 &
dd if=/dev/zero of=/dev/null count=1000000000000 &
for pid in $(jobs -p)
do 
  echo $pid
  sleep 120
  #wait $pid
  #[ "x$?" == "x0" ] && ((count++))
  kill -9 $pid 
done
