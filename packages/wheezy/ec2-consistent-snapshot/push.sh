#! /usr/bin/env bash
set -xe

RELEASE=$1
PACKAGE="ec2-consistent-snapshot"
REPOSITORY="amontalban/${PACKAGE}"
BASENAME=$(which basename)

mkdir -p ~/build/debs/debian/${RELEASE}/${PACKAGE}

cp -Rp *.deb ~/build/debs/debian/${RELEASE}/${PACKAGE}

# Remove existant packages
for deb in `ls -1 ~/build/debs/debian/${RELEASE}/${PACKAGE}/*.deb`; do
  FILE=`${BASENAME} $deb`
  package_cloud yank ${REPOSITORY}/debian/${RELEASE} ${FILE}
done

# Push new packages
package_cloud push ${REPOSITORY}/debian/${RELEASE} \
~/build/debs/debian/${RELEASE}/${PACKAGE}/*.deb
