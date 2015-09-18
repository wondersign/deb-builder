#! /usr/bin/env bash
set -xe

RELEASE=$1
PACKAGE="libnet-amazon-ec2-perl"
VERSION="0.29-1"

git clone https://github.com/amontalban/${PACKAGE}.git
cd ${PACKAGE}
git checkout tags/debian/${VERSION}
pdebuild --use-pdebuild-internal -- \
--basetgz /var/cache/pbuilder/debian-${RELEASE}.tgz
