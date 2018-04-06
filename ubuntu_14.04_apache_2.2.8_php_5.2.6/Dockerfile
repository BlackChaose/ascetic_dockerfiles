#ubuntu 14.04 + same soft
FROM bear85/ubuntu14.04-dev-base:latest
ENV DEBIAN_FRONTEND noninteractive
#----------------------------------------------------------------
EXPOSE 80 443
RUN ["/bin/bash","-c","mkdir /usr/local/src/ascetic"]
COPY scripts/ /usr/local/src/ascetic
COPY distrib/ /usr/local/src
RUN ["/bin/bash","-c","chmod +x /usr/local/src/ascetic/install_ascetic.sh"]
RUN ["/bin/bash","-c","/usr/local/src/ascetic/install_ascetic.sh"]
#VOLUME ["/var/www", "/var/log/apache2", "/etc/apache2"]
#ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
#------------------------------------------------------------------
ENV DEBIAN_FRONTEND teletype
CMD ["/bin/bash","-c","/usr/local/apache2/bin/httpd -k restart"]
# add to end for start mysql # CMD mysqld start
