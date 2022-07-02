#!/bin/sh
while true
do
	if curl -s CHECK_WEBSITE --output /dev/null -m 10; then
		echo "we have connection";
	else
		echo "we don't have connection";
		echo "killing";
		pkill openconnect
		pkill danted
		echo $ANYCONNECT_PASSWORD|openconnect $ANYCONNECT_SERVER --user=$ANYCONNECT_USER --servercert=$CERT --http-auth=$ANYCONNECT_AUTH_TYPE --reconnect-timeout=6000 -b
		sleep 2
		while ! ip link show | grep -q "tun0"; do
			echo "Initializing the tunnel"
			sleep 2
		done
		echo "Tunnel is ready!"

		/usr/sbin/danted -f /etc/danted.conf -D

		socat -d TCP4-LISTEN:3389,fork TCP4:$JUMP1:3389 &
		socat -d TCP4-LISTEN:3390,fork TCP4:$JUMP2:3389 &

	fi

	sleep 120
done

