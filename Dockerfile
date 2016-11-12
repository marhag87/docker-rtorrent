FROM fedora:latest
MAINTAINER Martin Hagstrom <marhag87@gmail.com>

# Install environment
RUN dnf update -y && dnf install -y rtorrent nginx cronie && dnf clean all && pip3 install flexget
ADD nginx.conf /etc/nginx/nginx.conf
ADD flexget /etc/cron.hourly/flexget
ADD start.sh /root/start.sh

ENTRYPOINT ["/root/start.sh"]
