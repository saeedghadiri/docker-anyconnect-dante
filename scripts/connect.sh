#!/bin/bash
echo $ANYCONNECT_PASSWORD|openconnect $ANYCONNECT_SERVER --user=$ANYCONNECT_USER -b

sleep 5

/usr/sbin/danted -f /etc/danted.conf -D

/bin/bash
