FROM centos:7.6.1810
LABEL io.openshift.s2i.scripts-url=image:///usr/libexec/s2i
ENV STI_SCRIPTS_PATH=/usr/libexec/s2i
RUN yum -y install httpd && \
    sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf && \
    chown -R apache.apache /var/log/httpd && \
    chown apache.apache -R /run/httpd
USER 48
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
