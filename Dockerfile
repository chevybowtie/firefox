FROM debian:sid-slim
LABEL maintainer "Paul Sturm <paul.sturm@cotton-software.com>"

RUN apt-get update && apt-get install -y \
	dirmngr \
	gnupg \
	--no-install-recommends \
	&& apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0AB215679C571D1C8325275B9BDB3D89CE49EC21 \
	&& echo "deb http://ppa.launchpad.net/mozillateam/firefox-next/ubuntu xenial main" >> /etc/apt/sources.list.d/firefox.list \
	&& apt-get update && apt-get install -y \
	apulse \
	ca-certificates \
	ffmpeg \
	firefox \
	hicolor-icon-theme \
	libasound2 \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libpulse0 \
	fonts-noto \
	fonts-noto-cjk \
	fonts-noto-color-emoji \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

ENV LANG en-US

COPY local.conf /etc/fonts/local.conf

RUN echo 'pref("browser.tabs.remote.autostart", false);' >> /etc/firefox/syspref.js

COPY entrypoint.sh /usr/bin/startfirefox

ENTRYPOINT [ "startfirefox" ]

# Credits:
# See more about running GUI apps in Docker containers: 
#  https://medium.com/better-programming/running-desktop-apps-in-docker-43a70a5265c4
#  jessfraz on GitHub

# X server: 
#  https://sourceforge.net/projects/vcxsrv/  (Windows)
#  https://www.xquartz.org/ (MacOS)
  
# BUILD: 
#  $ docker build . -t chevybowtie/firefox:latest

# WINDOWS HOST RUN: 
#  $ docker run --rm -ti --net=host -e DISPLAY=host.docker.internal:0 chevybowtie/firefox:latest

# LUNUX HOST RUN: 
#  $ docker run --rm -ti --net=host -e DISPLAY=:0 chevybowtie/firefox:latest
