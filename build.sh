#! /usr/bin/env bash
set -xe

apt-get update
apt-get -y install -t precise-backports debian-archive-keyring
apt-get -y install subversion pbuilder debootstrap devscripts dos2unix git
pbuilder create --distribution wheezy --debootstrapopts --keyring=/etc/apt/trusted.gpg.d/debian-archive-wheezy-stable.gpg --mirror http://httpredir.debian.org/debian/
pbuilder update
git clone https://github.com/amontalban/cutycapt.git
cd cutycapt
debian/rules get-orig-source
mv cutycapt*.tar.gz ..
pdebuild --use-pdebuild-internal
