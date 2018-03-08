############################################################
# Dockerfile to build shim and other VCOT tools
# based on Centos 7 
############################################################

FROM docker.io/centos:7 

# File Author / Maintainer
MAINTAINER Peter Panburana (pepanbur@cisco.com)

#Install basic build environment and headers
RUN yum groupinstall -y "Development Tools"
RUN yum install -y openssl-devel gnu-efi-devel elfutils-libelf-devel git openssl

#Install fpm and its dependencies
RUN yum install -y ruby-devel rpm-build rubygems
RUN gem install --no-ri --no-rdoc fpm

#Install GOSU
#ENV GOSU_VERSION 1.10
COPY gosu /usr/bin
RUN chmod +x /usr/bin/gosu && gosu nobody true

#Entrypoint file
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh

#shim build file
COPY build.sh /
RUN chmod 755 build.sh

#Entrypoint
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["/build.sh"]
