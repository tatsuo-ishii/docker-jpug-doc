# Docker file to compile PostgreSQL Japanese document

FROM centos:centos6

MAINTAINER Tatsuo Ishii <ishii@sraoss.co.jp>

RUN yum update -y
RUN yum install -y git

RUN git clone https://github.com/pgsql-jp/jpug-doc.git
RUN yum install -y gcc
RUN yum install -y readline-devel zlib-devel \
 docbook-dtds docbook-style-dsssl docbook-style-xsl libxslt openjade
ENV DOCDIR /jpug-doc
ADD build.sh /tmp/
CMD /tmp/build.sh
