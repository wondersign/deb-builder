#! /usr/bin/env bash
set -xe

for RELEASE in `echo wheezy`; do
  pbuilder create --basetgz /var/cache/pbuilder/debian-${RELEASE}.tgz \
  --distribution ${RELEASE} --debootstrapopts \
  --keyring=/etc/apt/trusted.gpg.d/debian-archive-${release}-stable.gpg \
  --mirror http://httpredir.debian.org/debian/

  pbuilder update

  cd ${ROOT_DIR}/packages/${RELEASE}
  for PACKAGE in `ls -1d */ | cut -f1 -d'/'`; do
    cd ${PACKAGE}
    ${BASH} build.sh ${RELEASE}
    cd ..
  done
done
