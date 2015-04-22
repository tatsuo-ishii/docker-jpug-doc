#!/bin/bash
if [ "$mode" = "" ];then
    cd $DOCDIR
else
    cd /var/volum
    groupadd -g $gid pgsql
    useradd -u $uid -g $gid pgsql
fi

if [ "$branch" = "" ];then
    branch=doc_ja_9_4
fi

git checkout $branch
#git pull
./configure --without-zlib --without-readline
#cat config.log
cd doc/src/
make html

if [ "$mode" = "" ];then
    cp -rp sgml/html /var/volum
fi


