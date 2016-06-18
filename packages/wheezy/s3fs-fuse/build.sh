#! /usr/bin/env bash
set -xe

RELEASE=$1
PACKAGE="s3fs-fuse"
VERSION="1.78"
REVISION="1"
ACCOUNT="wondersign"

git clone https://github.com/${ACCOUNT}/${PACKAGE}.git
cd ${PACKAGE}
git archive --format tar.gz --prefix=s3fs-fuse-${VERSION}/ \
--output ../s3fs-fuse_${VERSION}.orig.tar.gz master
git checkout debian
pdebuild --use-pdebuild-internal -- \
--basetgz /var/cache/pbuilder/debian-${RELEASE}.tgz
