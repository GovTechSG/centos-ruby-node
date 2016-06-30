FROM centos:centos6.6
MAINTAINER BGP

ENV RUBY_VERSION 2.2.0

RUN rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6 \
    && rpm -Kih http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm \
    && yum --enablerepo=epel -y install libyaml libyaml-devel readline-devel \
            ncurses-devel gdbm-devel tcl-devel openssl-devel db4-devel libffi-devel \
    && rpm -Kih https://github.com/feedforce/ruby-rpm/releases/download/2.2.0/ruby-2.2.0-1.el6.x86_64.rpm

ENTRYPOINT /bin/bash
