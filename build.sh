#!/bin/bash
cd $DOCDIR
git checkout doc_ja_9_4
./configure
cd doc/src/
make html
cp -rp sgml/html /var/volum

