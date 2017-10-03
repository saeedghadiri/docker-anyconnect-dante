FROM debian
RUN apt-get update && apt-get install -y openconnect iptables expect dante-server

ADD scripts/connect.sh /root
RUN chmod +x /root/connect.sh

ADD scripts/danted.conf /etc/danted.conf

EXPOSE 1081

CMD ["/root/connect.sh"]
