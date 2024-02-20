Docker
======

1. Build the image

`docker build -t aceproxy .`

2. Launch instance

`docker run --rm -i -p 8000:8000 aceproxy`

3.1. For acestream ID: In VLC, open network location `http://<HOST>:8000/pid/<HASH>/stream.mp4`

3.2 For torrent-magnet: In VLC, open network location `http://<HOST>:8000/torrent/URLENCODED_URL/FILE_INDEXES/DEVELOPER_ID/AFFILIATE_ID/ZONE_ID/STREAM_ID/video_file_name.extension`

Everything except URLENCODED_URL is optional. FILE_INDEXES count begins with 0. Video extension could be one of the following: `'.3gp', '.avi', '.flv', '.mkv', '.mov', '.mp4', '.mpeg', '.mpg', '.ogv', '.ts'`

AceProxy: Ace Stream HTTP Proxy
===============================

This is a merge between https://github.com/AndreyPavlenko/aceproxy and https://github.com/unsignedint/aceproxy

AceProxy allows you to watch [Ace Stream](http://acestream.org/) live streams or BitTorrent files over HTTP.
It's written in Python + gevent and should work on both Linux and Windows (Mac OS should work too, but was not tested)

Currently it supports Ace Stream Content-ID hashes (PIDs), .acestream files and usual torrent files.

**For installation, configuration and using info, visit** [Wiki](https://github.com/ValdikSS/aceproxy/wiki)
