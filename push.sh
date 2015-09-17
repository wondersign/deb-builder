#! /usr/bin/env bash
set -xe

BASH=$(which bash)

for RELEASE in `echo wheezy`; do
  cd ${CI_HOME}/packages/${RELEASE}
  for PACKAGE in `ls -1d */ | cut -f1 -d'/'`; do
    cd ${PACKAGE}
    ${BASH} push.sh ${RELEASE}
    cd ..
  done
done
