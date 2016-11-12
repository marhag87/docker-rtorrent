Dockerfile for running rTorrent with scgi

Suggested run command:
`sudo docker run -it --rm -v /path/to/storage:/rtorrent:Z -p 8008:8008 -p <torrent_port>:<torrent_port> -p <dht_port>:<dht_port>/udp marhag87/rtorrent`
