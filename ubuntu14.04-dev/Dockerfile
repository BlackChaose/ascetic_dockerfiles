#ubuntu 14.04 + same soft
FROM ubuntu:14.04
LABEL  dev.version="2018-04-05"
ENV DEBIAN_FRONTEND noninteractive
#----------------------------------------------------------------
RUN apt-get update && apt-get install -y \
	vim	    \
	gcc		\
	g++	    \
	make	\
	wget	\
	curl	\
	ssh		\
	openssl	\
	git		\
	locate	\
	links
#------------------------------------------------------------------
ENV DEBIAN_FRONTEND teletype