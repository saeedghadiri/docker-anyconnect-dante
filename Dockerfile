FROM ubuntu
RUN apt-get update && apt-get install -y openconnect iptables expect dante-server socat curl

ADD scripts/connect.sh /root
RUN chmod +x /root/connect.sh

ADD scripts/danted.conf /etc/danted.conf

EXPOSE 1081 3389

CMD ["/root/connect.sh"]