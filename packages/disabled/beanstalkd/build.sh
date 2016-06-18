#! /usr/bin/env bash
set -xe

RELEASE=$1
PACKAGE="beanstalkd"
VERSION="1.10"
REVISION="1"
ACCOUNT="wondersign"

git clone https://github.com/${ACCOUNT}/${PACKAGE}.git
cd ${PACKAGE}
git archive --format tar.gz --prefix=beanstalkd-${VERSION}/ \
--output ../beanstalkd_${VERSION}.orig.tar.gz upstream/${VERSION}
git checkout tags/debian/${VERSION}-${REVISION}
pdebuild --use-pdebuild-internal -- \
--basetgz /var/cache/pbuilder/debian-${RELEASE}.tgz
