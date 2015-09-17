#! /usr/bin/env bash
set -xe

RELEASE=$1
PACKAGE="cutycapt"

git clone https://github.com/amontalban/${PACKAGE}.git
cd ${PACKAGE}
debian/rules get-orig-source
mv ${PACKAGE}*.tar.gz ..
pdebuild --use-pdebuild-internal -- \
--basetgz /var/cache/pbuilder/debian-${RELEASE}.tgz
