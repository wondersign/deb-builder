#! /usr/bin/env bash
set -xe

BASH=$(which bash)

for RELEASE in `echo wheezy`; do
  pbuilder create --basetgz /var/cache/pbuilder/debian-${RELEASE}.tgz \
  --distribution ${RELEASE} --debootstrapopts \
  --keyring=/etc/apt/trusted.gpg.d/debian-archive-${RELEASE}-stable.gpg \
  --mirror http://httpredir.debian.org/debian/ --aptconfdir ${CI_HOME}/etc/apt

  pbuilder update --basetgz /var/cache/pbuilder/debian-${RELEASE}.tgz \
  --aptconfdir ${CI_HOME}/etc/apt

  cd ${CI_HOME}/packages/${RELEASE}
  for PACKAGE in `ls -1d */ | cut -f1 -d'/'`; do
    cd ${PACKAGE}
    ${BASH} build.sh ${RELEASE}
    cd ..
  done
done
