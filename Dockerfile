FROM centos:7
MAINTAINER Sumit Kumar <sumitk.85@gmail.com>

RUN yum -y install epel-release \
    && yum -y install php \
    && yum -y install php-fpm \
    && yum -y install php-pear \
    && yum -y install php-mysql \
    && yum -y install php-cli \
    && yum -y install php-common \
    && yum -y install php-xml \
    && yum -y install nginx \
    && yum -y install tar wget \
    && yum -y install python-pip

RUN rpm -Uvh http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
RUN yum -y install mysql-community-server
RUN /usr/bin/systemctl enable mysqld

#RUN wget https://pypi.python.org/packages/source/s/supervisor/supervisor-3.1.3.tar.gz -P /tmp/ \
#    && tar -xvf /tmp/supervisor-3.1.3.tar.gz -C /tmp/
#RUN python /tmp/supervisor-3.1.3/setup.py install

RUN yum -y install supervisor
RUN pip install supervisor-stdout

COPY ./supervisord.conf /etc/

RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php-fpm.conf

RUN sed -i '/^listen/c \
    listen = 0.0.0.0:9000' /etc/php-fpm.d/www.conf && \
    sed -i 's/^listen.allowed_clients/;listen.allowed_clients/' /etc/php-fpm.d/www.conf && \
    mkdir -p /srv/http && \
    chown -R apache:apache /srv/http && \
    chown -R apache:apache /var/run/php-fpm

COPY ./site/index.php /srv/http/
COPY ./conf/nginx.conf /etc/nginx/

EXPOSE 9000 80
VOLUME /srv/http
COPY ./site/ /srv/http

COPY ./start.sh /start/
LABEL stack=LEMP 
CMD sh /start/start.sh
