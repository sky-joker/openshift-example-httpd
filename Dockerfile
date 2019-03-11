FROM centos:centos7
RUN yum -y install httpd && \
    sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf && \
    sed -i "s/CustomLog \"logs\/access_log\" combined/CustomLog \"\/tmp\/access_log\" combined/g" /etc/httpd/conf/httpd.conf && \
    sed -i "s/ErrorLog \"logs\/error_log\"/ErrorLog \"\/tmp\/error_log\"/g" /etc/httpd/conf/httpd.conf && \
    echo "PidFile /tmp/httpd.pid" >> /etc/httpd/conf/httpd.conf && \
    echo "DefaultRuntimeDir /tmp" >> /etc/httpd/conf/httpd.conf
USER 48
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
