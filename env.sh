#! /usr/bin/env bash
set -xe

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
sudo -E sh -c "echo 'deb http://archive.ubuntu.com/ubuntu precise-backports main restricted universe multiverse' > /etc/apt/sources.list.d/precise-backports.list"
sudo -E sh -c "echo 'OTHERMIRROR=\"deb http://httpredir.debian.org/debian wheezy-backports main\"' >> ~/.pbuilderrc"
