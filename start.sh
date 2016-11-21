#!/bin/bash

RT_UID=${RT_UID:=1000}
RT_GID=${RT_GID:=1000}
groupadd -g $RT_GID rtorrent
useradd -u $RT_UID -g $RT_GID -d /rtorrent -m rtorrent 2>/dev/null
mkdir -p /rtorrent/{session,torrents,download}
chown -R rtorrent:rtorrent /rtorrent

crond -n &
nginx &
exec su --login --command="TERM=xterm /usr/bin/rtorrent -d /rtorrent/torrents -s /rtorrent/session -o directory=/rtorrent/download -o scgi_port=localhost:5000" rtorrent
