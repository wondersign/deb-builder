#! /usr/bin/env bash
set -xe

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
sudo -E sh -c "echo 'deb http://archive.ubuntu.com/ubuntu precise-backports main restricted universe multiverse' > /etc/apt/sources.list.d/precise-backports.list"
sudo apt-get update
sudo apt-get -y install -t precise-backports debian-archive-keyring
sudo apt-get -y install subversion pbuilder debootstrap devscripts dos2unix git
sudo -E sh -c "echo 'OTHERMIRROR=\"deb http://httpredir.debian.org/debian wheezy-backports main\"' >> ~/.pbuilderrc"
sudo pbuilder create --distribution wheezy --debootstrapopts --keyring=/etc/apt/trusted.gpg.d/debian-archive-wheezy-stable.gpg --mirror http://httpredir.debian.org/debian/
sudo pbuilder update
sudo git clone https://github.com/amontalban/cutycapt.git
cd cutycapt
sudo debian/rules get-orig-source
sudo mv cutycapt*.tar.gz ..
sudo pdebuild --use-pdebuild-internal
mkdir -p ~/build/debs
sudo cp -Rp ../*.deb ~/build/debs
sudo package_cloud push amontalban/cutycapt/debian/wheezy ~/build/debs/*.deb