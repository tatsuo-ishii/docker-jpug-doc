#! /bin/bash
myname=$0
uid=0
gid=0

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
	else
	    echo "usage: $myname [-p doc_dir] [-u user_id] [-g group_id]"
	    exit 1
	fi
	shift
    done
fi 

docker build -t pgsql_doc_ja .

if [ $mode = "private" ];then
    docker run --rm -e mode=$mode -e uid=$uid -e gid=$gid -v $dir:/var/volum pgsql_doc_ja
else
    docker run --rm -v $HOME/volum:/var/volum pgsql_doc_ja
fi

