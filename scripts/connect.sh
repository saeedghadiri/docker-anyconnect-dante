#!/bin/bash
echo $ANYCONNECT_PASSWORD|openconnect $ANYCONNECT_SERVER --user=$ANYCONNECT_USER -b

sleep 5

/usr/sbin/danted -f /etc/danted.conf -D

socat TCP4-LISTEN:3389 TCP4:10.52.160.4:3389 &
socat TCP4-LISTEN:3390 TCP4:10.52.160.68:3389 &

/bin/bash
