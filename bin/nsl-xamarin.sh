#!/bin/bash

#
# xamarin.com dns monitor
# To use:
#   watch -n 10 ~/bin/nsl-xamarin.sh
#

nslookup xamarin.com 217.21.169.19 -timeout=1 2>&1 | grep -i "SERVFAIL\|NXDOMAIN\|REFUSED\|not found\|no servers"

if [ $? -eq 0 ]; then
    echo red
    echo -n "red" | nc -4u -w0 localhost 1738
else
    echo green
    echo -n "green" | nc -4u -w0 localhost 1738
fi
