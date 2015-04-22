#! /bin/bash
myname=$0
uid=0
gid=0
branch=doc_ja_9_4
dist=ubuntu

if [ $# -eq 0 ];then
    mode=repo
else

    while [ $# -gt 0 ]
    do
	if [ $1 = "-p" ];then
	    shift
	    mode=private
	    dir=$1
	elif [ $1 = "-u" ];then
	    shift
	    uid=$1
	elif [ $1 = "-g" ];then
	    shift
	    gid=$1
	elif [ $1 = "-b" ];then
	    shift
	    branch=$1
	elif [ $1 = "-d" ];then
	    shift
	    dist=$1
	    if [ ! -f Dockerfile.$dist ];then
		echo "distribution should be one of ubuntu, centos6."
		exit 1
	    fi
	else
	    echo "usage: $myname [-p doc_dir] [-u user_id] [-g group_id] [-b branch] [-d distribution]"
	    echo "branch is either doc_ja_9_4 or doc_ja_9_4_utf8 (default: doc_ja_9_4)"
	    echo "distribution is one of: ubuntu, centos6 (default: ubuntu)"
	    exit 1
	fi
	shift
    done
fi 

rm -f Dockerfile
ln -s Dockerfile.$dist Dockerfile

docker build -t pgsql_doc_ja .

if [ $mode = "private" ];then
    docker run --rm -e mode=$mode -e uid=$uid -e gid=$gid -e branch=$branch -v $dir:/var/volum pgsql_doc_ja
else
    docker run --rm -v $HOME/volum:/var/volum pgsql_doc_ja
fi
