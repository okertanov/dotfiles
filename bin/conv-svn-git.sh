#!/bin/sh

#    Copyright (C) 2011 Oleg Kertanov <okertanov@gmail.com>
#    All rights reserved.

svn_repos=""

for i in $svn_repos
do
sudo git svn clone svn+ssh://okertanov@e.com/var/svn/repo/trunk/$i
sudo git clone --bare --shared file://$i $i.git
sudo rm -rf $i

sudo chown -R root:developers ./$i.git
sudo chmod -R g+wX,o= ./$i.git
sudo find ./$i.git -type d -exec chmod g+s '{}' ';'

pushd ./
cd ./$i.git
git update-server-info
popd
done


