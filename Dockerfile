FROM ubuntu:trusty
MAINTAINER ASCDC <asdc.sinica@gmail.com>

RUN mkdir /script
ADD run.sh /script/run.sh

RUN DEBIAN_FRONTEND=noninteractive && \
	chmod +x /script/*.sh && \
	locale-gen en_US.UTF-8 && \
	export LANG=en_US.UTF-8 && \
	apt-get -qq update && \
	apt-get -y -qq dist-upgrade
RUN DEBIAN_FRONTEND=noninteractive && apt-get -qq install -y vim screen wget git curl openjdk-8-jdk

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

WORKDIR /script
ENTRYPOINT ["/script/run.sh"]
