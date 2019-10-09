FROM centos:7
ENV container docker
RUN curl -Lo /tini https://github.com/krallin/tini/releases/download/v0.18.0/tini-amd64; \
chmod 755 /tini
RUN yum install -y postfix cyrus-sasl-plain rsyslog; \
yum clean all; \
postconf inet_protocols=ipv4
COPY . /
VOLUME [ "/var/spool/postfix" ]
EXPOSE 25 465 587
ENTRYPOINT ["/tini", "/startpostfix.sh"]
