#!/bin/bash
if [ "$mode" = "" ];then
    cd $DOCDIR
else
    cd /var/volum
    groupadd -g $gid pgsql
    useradd -u $uid -g $gid pgsql
fi

git checkout doc_ja_9_4
./configure
cd doc/src/
make html

if [ "$mode" = "" ];then
    cp -rp sgml/html /var/volum
fi


