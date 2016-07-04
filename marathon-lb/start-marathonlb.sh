#!/bin/bash

# start rsyslog
service rsyslog start

mkdir -p /var/state/haproxy/
touch /var/state/haproxy/global

# start haproxy
service haproxy start

openssl genrsa -out /tmp/server-key.pem 2048
openssl req -new -key /tmp/server-key.pem -out /tmp/server-csr.pem -subj /CN=*/
openssl x509 -req -in /tmp/server-csr.pem -out /tmp/server-cert.pem -signkey /tmp/server-key.pem -days 3650
cat /tmp/server-cert.pem /tmp/server-key.pem > /etc/ssl/cert.pem
rm /tmp/server-*.pem

marathon_lb.py --marathon http://localhost:8080 \
               --group external \
               --ssl-certs /etc/ssl/cert.pem \
               --syslog-socket /dev/null \
               --sse \
               --command "reload-haproxy.sh"
