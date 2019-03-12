FROM ubuntu:bionic

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH=/opt/acestream:$PATH

COPY . /app

RUN apt-get -y update && \
  apt-get -y upgrade && \
  apt-get -y install -y wget python python-pip python-dev python-requests python-setuptools python-m2crypto python-apsw libssl1.0.0 libssl-dev && \
  mkdir -p /opt/acestream && \
  cd /opt/acestream && \
  wget http://acestream.org/downloads/linux-beta/acestream_3.1.35_ubuntu_18.04_x86_64.tar.gz && \
  tar -xvzf acestream_3.1.35_ubuntu_18.04_x86_64.tar.gz && \
  rm -f acestream_3.1.35_ubuntu_18.04_x86_64.tar.gz && \
  pip install -r /app/requirements.txt && \
  apt-get -y remove -y wget python-pip python-dev && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /tmp/* && \
  echo '#!/bin/sh\n\
echo "=== bound to port 8000: $(hostname -I) ==="\n\
/opt/acestream/start-engine --client-console & \n\
python /app/acehttp.py\n\
' > /run.sh && \
  chmod +x /run.sh

EXPOSE 8000
ENTRYPOINT ["/run.sh"]

