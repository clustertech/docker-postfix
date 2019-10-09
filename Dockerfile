FROM centos:7
ENV container docker
RUN yum install -y postfix cyrus-sasl-plain; \
yum clean all; \
postconf inet_protocols=ipv4
COPY . /
VOLUME [ "/var/spool/postfix" ]
EXPOSE 25 465 587
ENTRYPOINT ["/startpostfix.sh"]
