#!/usr/bin/env bash 


echo "Example use column"
sed 's/#.*//' /etc/fstab | column -t

echo "use column to pretty print proc file"
cat /proc/net/dev | column  -t


