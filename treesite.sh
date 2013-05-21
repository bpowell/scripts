#!/usr/bin/env sh

files=$(egrep -o "([a-Z_.]*(\/))*[a-Z_.]*(\.php|\.txt|\.pl|\.inc|\.tmp|\.jpg|\.css)" $1 | awk '{system("readlink -f " $1 )}')
dirs=$(egrep -o -E 'href="([^"#]+)"' $1 | cut -d '"' -f2 | awk '{system("readlink -f " $1)}')
all=$(echo $files $dirs | tr " " "\n" | sort -u)
echo $all | tr " " "\n" | awk '{if(system(" [ -f " $1 " ] ")==0){print $1}else{print $1 " - NOT FOUND"}}'
