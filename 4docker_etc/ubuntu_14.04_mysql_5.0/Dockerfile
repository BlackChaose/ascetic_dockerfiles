#ubuntu 14.04 + MySQL5.0.51b
#Attention it conf for dev/test!!! not attached volume! your data in MySQL not saved!
FROM ubuntu:14.04
LABEL  dev.version="2018-04-02"
#------------open ports-------------
EXPOSE 3306/tcp
EXPOSE 3306/udp
ENV DEBIAN_FRONTEND noninteractive
#type your's environments
ENV MYSQL_REMOTE_ADMIN  admin
ENV MYSQL_RA_PASSWORD   QazWsx12
ENV MYSQL_RA_IPADDRESS  172.17.0.1
#------------/open ports-------------
#----------------------------------------------------------------
RUN apt-get update && apt-get install -y \
	vim	\
	gcc		\
	g++	\
	make	\
	wget	\
	curl	\
	ssh		\
	openssl	\
	git		\
	locate	\
	links
RUN ["/bin/bash","-c","mkdir /usr/local/src/ascetic"]
COPY scripts/ /usr/local/src/ascetic
COPY sources/ /usr/local/src
RUN ["/bin/bash","-c","chmod +x /usr/local/src/ascetic/install_mysql_5.0.51.sh"]
RUN ["/bin/bash","-c","/usr/local/src/ascetic/install_mysql_5.0.51.sh"]
#------------------------------------------------------------------
CMD ["/bin/bash","-c","/usr/local/mysql/bin/mysqld_safe --user=mysql &"]
ENV DEBIAN_FRONTEND teletype