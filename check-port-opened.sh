#!/bin/bash


timeout 1 bash -c 'cat < /dev/null > /dev/tcp/127.0.0.1/22'
echo "22 port rusult: $?"


timeout 1 bash -c 'cat < /dev/null > /dev/tcp/google.com/81'
echo "google.com 81 rusult: $?"


# refer: https://stackoverflow.com/questions/4922943/test-if-remote-tcp-port-is-open-from-a-shell-script
