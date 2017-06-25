Docker
======

1. Build the image

`docker build -t aceproxy .`

2. Launch instance

`docker run --rm -Pi aceproxy`

3. Connect to IP of docker machine and port from `docker ps` output

4. Watch, VLC remote with: http://<HOST>:<PORT>/pid/<HASH>/stream.mp4

AceProxy: Ace Stream HTTP Proxy
===============================
AceProxy allows you to watch [Ace Stream](http://acestream.org/) live streams or BitTorrent files over HTTP.
It's written in Python + gevent and should work on both Linux and Windows (Mac OS should work too, but was not tested)

Currently it supports Ace Stream Content-ID hashes (PIDs), .acestream files and usual torrent files.

**For installation, configuration and using info, visit** [Wiki](https://github.com/ValdikSS/aceproxy/wiki)
