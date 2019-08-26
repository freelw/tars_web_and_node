#FROM ubuntu:18.04
FROM nvidia/cuda:10.1-base

RUN  apt update \
	&& apt-get -y install wget \
	&& wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash \
	&& . ~/.bashrc \
	&& nvm install v8.11.3 \
	&& npm install -g pm2 --registry=https://registry.npm.taobao.org \
	&& apt-get install -y git \
	&& mkdir -p /data/code && cd /data/code \
	&& git clone https://github.com/TarsCloud/TarsWeb.git \
	&& cd TarsWeb \
	&& npm install --registry=https://registry.npm.taobao.org \
	&& npm run prd
RUN apt-get install -y net-tools telnet rsync mysql-client libgomp1 cron vim python libpython2.7
RUN apt-get install -y locales 
RUN apt-get install -y language-pack-en language-pack-en-base language-pack-zh-hans language-pack-zh-hans-base language-pack-zh-hant language-pack-zh-hant-base

COPY entrypoint.sh /root/entrypoint.sh
ADD pack /root/pack
ADD pack_normal /root/pack_normal
ADD sql /root/sql
WORKDIR /root/
ENV TZ=Asia/Shanghai
ENV DBIP 127.0.0.1
ENV DBPort 3306
ENTRYPOINT ["/root/entrypoint.sh"]
