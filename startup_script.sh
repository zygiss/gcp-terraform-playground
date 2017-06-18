#!/bin/sh

saltstack_repo="https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm"

yum -y install ${saltstack_repo} && \
    yum -y install salt-minion && \
    yum -y update && \
    yum -y clean expire-cache && \
    systemctl enable salt-minion && \
    reboot
