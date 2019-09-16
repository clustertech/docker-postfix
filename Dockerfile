FROM centos:7
ENV container docker
RUN yum install -y postfix cyrus-sasl-plain rsyslog; \
yum clean all; \
postconf inet_protocols=ipv4
COPY . /
VOLUME [ "/var/spool/postfix" ]
EXPOSE 25 465 587
CMD /startpostfix.sh
