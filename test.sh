#!/bin/sh

echo $$
dd if=/dev/zero of=/dev/null   count=1000000000000 &


