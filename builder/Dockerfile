FROM centos:7

RUN yum -y groups mark convert
RUN yum -y groups install "Development Tools"

RUN useradd builder
USER builder
