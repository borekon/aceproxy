FROM ubuntu:trusty

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y wget && \
  bash -c "echo 'deb http://repo.acestream.org/ubuntu/ trusty main' | tee /etc/apt/sources.list.d/acestream.list && wget -O - http://repo.acestream.org/keys/acestream.public.key | apt-key add -" && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y python python-pip python-dev acestream-engine && \
  mkdir /app

COPY . /app
RUN pip install -r /app/requirements.txt && \
  rm -rf /var/lib/apt/lists/* && \
  echo '\
#!/bin/sh
echo "=== bound to port 8000: $(hostname -I) ===" \n\
python /app/acehttp.py    \n\
' > /run.sh && chmod +x /run.sh

EXPOSE 8000
ENTRYPOINT ["/bin/sh", "/run.sh"]

