#! /usr/bin/env bash
set -xe

RELEASE=$1
PACKAGE="cutycapt"
REPOSITORY="amontalban/${PACKAGE}"
BASENAME=$(which basename)

mkdir -p ~/build/debs/debian/${RELEASE}/${PACKAGE}

cp -Rp *.deb ~/build/debs/debian/${RELEASE}/${PACKAGE}

# Push new packages
package_cloud --yes --verbose push ${REPOSITORY}/debian/${RELEASE} \
~/build/debs/debian/${RELEASE}/${PACKAGE}/*.deb
