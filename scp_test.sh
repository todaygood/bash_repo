#!/usr/bin/expect

spawn scp -P 22 /root/abc root@192.168.160.11:/opt

while {1} {
  expect {
    "*password"   {send "novell\r"}
    eof           {break}
  }
}
