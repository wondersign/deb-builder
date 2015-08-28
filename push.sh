#! /usr/bin/env bash
set -xe

mkdir -p ~/build/debs
cp -Rp *.deb ~/build/debs
package_cloud push amontalban/cutycapt/debian/wheezy ~/build/debs/*.deb
