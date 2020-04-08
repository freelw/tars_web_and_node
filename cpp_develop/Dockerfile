FROM ubuntu:18.04

RUN  apt update \
	&& apt-get -y install git cmake \
	&& mkdir -p /data/code/TarsFramework/ \
	&& cd  /data/code/TarsFramework/ \
	&& git clone -b my_base https://github.com/freelw/TarsFramework.git --recursive 
RUN apt-get -y install g++ zlibc zlib1g-dev libmysql++-dev
RUN apt-get -y install flex bison
RUN  mkdir -p /usr/local/mysql/ && ln -s /usr/include/mysql /usr/local/mysql/include && ln -s /usr/lib/x86_64-linux-gnu/ /usr/local/mysql/lib \ 
	&&cd /data/code/TarsFramework/TarsFramework/build \
	&& chmod u+x build.sh \
	&& ./build.sh prepare \
	&& ./build.sh all \
	&& mkdir -p /usr/local/tars \
	&& cd /data/code/TarsFramework/TarsFramework/build \
	&& ./build.sh install
