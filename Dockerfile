FROM centos:centos6.6
MAINTAINER BGP

ENV RUBY_VERSION 2.3.1
ENV NODEJS_VERSION 7.1.0

RUN set -x \
    && rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6 \
    && rpm -Kih http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm \
    && yum -y groupinstall "Development Tools" \
    && yum --enablerepo=epel -y install libyaml libyaml-devel readline-devel \
            ncurses-devel gdbm-devel tcl-devel openssl-devel db4-devel libffi-devel \
    && echo "Installing Ruby" \
    && rpm -Kih "https://github.com/feedforce/ruby-rpm/releases/download/${RUBY_VERSION}/ruby-${RUBY_VERSION}-1.el6.x86_64.rpm" \
    && echo "Installing Node.js" \
    && curl -sL https://rpm.nodesource.com/setup_7.x | bash - \
    && yum install --nogpgcheck -y "nodejs-${NODEJS_VERSION}-1nodesource.el6" \
    && yum clean all

ENTRYPOINT /bin/bash
