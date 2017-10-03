#!/bin/bash
echo $ANYCONNECT_PASSWORD|openconnect $ANYCONNECT_SERVER --user=$ANYCONNECT_USER -b

sleep 5

/usr/sbin/danted -f /etc/danted.conf -D

nc -l -p 3389 -c "nc 10.52.160.4 3389" &

/bin/bash
