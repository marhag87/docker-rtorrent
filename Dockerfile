FROM fedora:latest
MAINTAINER Martin Hagstrom <marhag87@gmail.com>

# Install environment
RUN dnf update -y && dnf install -y rtorrent nginx && dnf clean all
ADD nginx.conf /etc/nginx/nginx.conf
ADD start.sh /root/start.sh

ENTRYPOINT ["/root/start.sh"]
