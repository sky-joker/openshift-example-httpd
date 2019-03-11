FROM centos:centos7
RUN yum -y install httpd && \
    sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf && \
    chown -R apache.apache /var/log/httpd && \
    chown -R apache.apache /run/httpd
#USER 48
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
