#! /usr/bin/env bash
set -xe

for RELEASE in `echo wheezy`; do
  cd ${ROOT_DIR}/packages/${RELEASE}
  for PACKAGE in `ls -1d */ | cut -f1 -d'/'`; do
    cd ${PACKAGE}
    ${BASH} push.sh ${RELEASE}
    cd ..
  done
done
