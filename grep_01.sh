#!/usr/bin/env bash

# find non empty line or # begin in a conf file 

cat /etc/my.cnf  | grep -Evn "^$|#"

