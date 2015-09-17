#! /usr/bin/env bash
set -xe

apt-get -o Acquire::ForceIPv4=true update
apt-get -o Acquire::ForceIPv4=true -y install -t precise-backports \
debian-archive-keyring
apt-get -o Acquire::ForceIPv4=true -y install subversion pbuilder debootstrap \
devscripts dos2unix git
