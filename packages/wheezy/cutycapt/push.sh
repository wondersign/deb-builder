#! /usr/bin/env bash
set -xe

RELEASE=$1
PACKAGE="cutycapt"
REPOSITORY="amontalban/${PACKAGE}"
BASENAME=$(which basename)
CURL=$(which curl)

mkdir -p ~/build/debs/debian/${RELEASE}/${PACKAGE}

cp -Rp *.deb ~/build/debs/debian/${RELEASE}/${PACKAGE}

for deb in `ls -1 ~/build/debs/debian/${RELEASE}/${PACKAGE}/*.deb`; do
  FILE=`${BASENAME} $deb`
  URL="https://packagecloud.io/${REPOSITORY}/packages/debian/${RELEASE}/${FILE}/download"
  PACKAGE_EXISTS=`${CURL} -s -o /dev/null -w "%{http_code}" ${URL}`
  if [ ${PACKAGE_EXISTS} -ne '404' ]; then
    # Package exists so we first need to delete it
    package_cloud yank ${REPOSITORY}/debian/${RELEASE} ${FILE}
  fi

  # Push new packages
  package_cloud push ${REPOSITORY}/debian/${RELEASE} \
  ~/build/debs/debian/${RELEASE}/${PACKAGE}/${FILE}
done
