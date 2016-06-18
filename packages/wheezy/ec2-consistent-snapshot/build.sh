#! /usr/bin/env bash
set -xe

RELEASE=$1
PACKAGE="ec2-consistent-snapshot"
ACCOUNT="wondersign"

git clone https://github.com/${ACCOUNT}/${PACKAGE}.git
cd ${PACKAGE}
pdebuild --use-pdebuild-internal -- \
--basetgz /var/cache/pbuilder/debian-${RELEASE}.tgz
