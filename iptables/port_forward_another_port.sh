#!/usr/bin/env bash

#step1. 需要先开启linux的数据转发功能
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p  #使数据转发功能生效


#Step2:将外网访问80端口的数据转发到8080端口
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8080

#将本机访问80端口的转发到本机8080
iptables -t nat -A OUTPUT -p tcp -d 127.0.0.1 --dport 80 -j DNAT --to 127.0.0.1:8080
iptables -t nat -A OUTPUT -p tcp -d 192.168.4.177 --dport 80 -j DNAT --to 127.0.0.1:8080

#本地连接指的是在本机上，用 127.0.0.1 或者本机 IP 来访问本机的端口。本地连接的数据包不会通过网卡，而是由内核处理后直接发给本地进程。这种数据包在 iptables 中只经过 OUTPUT 链，而不会经过 PREROUTING 链。所以需要在 OUTPUT 链中进行 DNAT。除了对 127.0.0.1 之外，对本机 IP (即 192.168.4.177) 的访问也属于本地连接。



#Refer http://coolnull.com/3322.html
