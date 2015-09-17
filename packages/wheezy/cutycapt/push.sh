#! /usr/bin/env bash
set -xe

RELEASE=$1
PACKAGE="cutycapt"
REPOSITORY="amontalban/${PACKAGE}"

mkdir -p ~/build/debs/debian/${RELEASE}/${PACKAGE}

cp -Rp *.deb ~/build/debs/debian/${RELEASE}/${PACKAGE}

package_cloud push ${REPOSITORY}/debian/${RELEASE} \
~/build/debs/debian/${RELEASE}/*.deb
