# AnyConnect + Dante in docker container with auto restart

This docker Provides SOCKS proxy on port 1081 that tunnels connections via AnyConnect VPN client so you can share your vpn across network or dockers. It works with Iranian VPNs such as speedvpn.

By checking `CHECK_WEBSITE` , this program determines whether it is connected to the vpn or not. If it has been disconnected, It tries to restart anyconnect and reconnects to server.
## How to use
1. Install docker
2. clone this project
3. Set server, username, password and cert on docker-compose.yml file
4. cd to the directory and run docker compose. for example in:
###

    docker-compose -f docker-compose.yml up -d

## Example of setting fields on docker compose file for speedvpn

    - ANYCONNECT_SERVER=s36.serspeed.info:555
    - ANYCONNECT_USER=myusername
    - ANYCONNECT_PASSWORD=mypassword
    - CERT=pin-sha256:bP61cIU9tXSiZ0BEbt1OYEvYoQNMOXRMGug3wbbssNI=
    - CHECK_WEBSITE=twitter.com
