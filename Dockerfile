# base image
FROM centos

# MAINTAINER
MAINTAINER jmb33595@163.com

# put nginx-1.21.1.tar.gz into /usr/local/src and unpack nginx
ADD nginx-1.21.1.tar.gz /usr/local/src

# running required command
RUN yum install -y gcc gcc-c++ glibc make autoconf openssl openssl-devel
RUN yum install -y libxslt-devel -y gd gd-devel GeoIP GeoIP-devel pcre pcre-devel
RUN useradd -M -s /sbin/nologin nginx

# change dir to /usr/local/src/nginx-1.21.1
WORKDIR /usr/local/src/nginx-1.21.1

# execute command to compile nginx
RUN ./configure --user=nginx --group=nginx --prefix=/usr/local/nginx --with-file-aio --with-http_ssl_module --with-http_realip_module --with-http_addition_module --with-http_xslt_module --with-http_image_filter_module --with-http_geoip_module --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_auth_request_module --with-http_random_index_module --with-http_secure_link_module --with-http_degradation_module --with-http_stub_status_module && make && make install

EXPOSE 80