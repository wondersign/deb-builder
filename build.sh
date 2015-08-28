#! /usr/bin/env bash
set -xe

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
echo "deb http://archive.ubuntu.com/ubuntu precise-backports main restricted universe multiverse" > /etc/apt/sources.list.d/precise-backports.list
apt-get update
apt-get -y install -t precise-backports debian-archive-keyring
apt-get -y install subversion pbuilder debootstrap devscripts dos2unix git
echo 'OTHERMIRROR=\"deb http://httpredir.debian.org/debian wheezy-backports main\"' >> ~/.pbuilderrc
pbuilder create --distribution wheezy --debootstrapopts --keyring=/etc/apt/trusted.gpg.d/debian-archive-wheezy-stable.gpg --mirror http://httpredir.debian.org/debian/
pbuilder update
git clone https://github.com/amontalban/cutycapt.git
cd cutycapt
debian/rules get-orig-source
mv cutycapt*.tar.gz ..
pdebuild --use-pdebuild-internal
