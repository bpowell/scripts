#!/usr/bin/env bash
if test $# -lt 2
then
	echo "Needs filename to grep through and directory to search."
	echo "example: findfiles.sh filename directory."
	exit 0
fi

filename=$1
dir=$2
echo "Searching directory: $dir"
egrep -h -o "[a-Z]*(\.php|\.pl)" $filename | sort | uniq | awk '{cmd="[ -f " "'$dir'" $1 " ]";if(system(cmd)==0){print "File " $1 " found in ""'$dir'";}}' 
