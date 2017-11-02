#!/usr/bin/env bash

#step1. 需要先开启linux的数据转发功能
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p  #使数据转发功能生效

#将外网访问192.168.75.5的80端口转发到192.168.75.3:8000端口。
iptables -t nat -A PREROUTING -d 192.168.75.5 -p tcp --dport 80 -j DNAT --to-destination 192.168.75.3:8000

#将192.168.75.3 8000端口将数据返回给客户端时，将源ip改为192.168.75.5
iptables -t nat -A POSTROUTING -d 192.168.75.3 -p tcp --dport 8000 -j SNAT 192.168.75.5

#Refer http://coolnull.com/3322.html
