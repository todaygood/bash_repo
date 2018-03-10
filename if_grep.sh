#!/usr/bin/env bash

if grep -q "$user2" /etc/passwd; then
    echo "User does exist!!"
else
    echo "User does not exist!!"
fi

if ! grep -q "$user2" /etc/passwd; then
    echo "User does not exist!!"
fi
