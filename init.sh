#! /usr/bin/env bash
set -xe

apt-get update
apt-get -y install -t precise-backports debian-archive-keyring
apt-get -y install subversion pbuilder debootstrap devscripts dos2unix git
