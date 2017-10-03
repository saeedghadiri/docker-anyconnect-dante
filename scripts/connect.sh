#!/bin/bash
echo $ANYCONNECT_PASSWORD|openconnect $ANYCONNECT_SERVER --user=$ANYCONNECT_USER -b

sleep 5

/usr/sbin/danted -f /etc/danted.conf -D

socat -d TCP4-LISTEN:3389,fork TCP4:$JUMP1:3389 &
socat -d TCP4-LISTEN:3390,fork TCP4:$JUMP2:3389 &

/bin/bash
