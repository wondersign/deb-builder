#! /usr/bin/env bash
set -xe

RELEASE=$1
PACKAGE="libnet-amazon-ec2-perl"
VERSION="0.29"
REVISION="1"
ACCOUNT="wondersign"

git clone https://github.com/${ACCOUNT}/${PACKAGE}.git
cd ${PACKAGE}
git archive --format tar.gz --prefix=Net-Amazon-EC2-${VERSION}/ \
--output ../libnet-amazon-ec2-perl_${VERSION}.orig.tar.gz upstream/${VERSION}
git checkout tags/debian/${VERSION}-${REVISION}
pdebuild --use-pdebuild-internal -- \
--basetgz /var/cache/pbuilder/debian-${RELEASE}.tgz
