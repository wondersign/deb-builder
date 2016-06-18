#! /usr/bin/env bash
set -xe

RELEASE=$1
PACKAGE="cutycapt"
ACCOUNT="wondersign"

git clone https://github.com/${ACCOUNT}/${PACKAGE}.git
cd ${PACKAGE}
debian/rules get-orig-source
mv ${PACKAGE}*.tar.gz ..
pdebuild --use-pdebuild-internal -- \
--basetgz /var/cache/pbuilder/debian-${RELEASE}.tgz
