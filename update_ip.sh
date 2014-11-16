#!/bin/bash -
#
#2014年 11月 16日 星期日 17:47:28 CST

ip_file="./tempfile"
getipshell="./getmywebip.sh"

if [ ! -r $ip_file ] || [ ! -r $getipshell ]; then
    echo 'need the ip_file and getmywebip.sh'
    exit 1
fi

old_ip=$(cat "$ip_file")
new_ip=$($getipshell)
#echo -e "old ip is $old_ip\nnew ip is $new_ip"

if [[ "${old_ip}" != "${new_ip}" ]]; then
    echo "$new_ip" > "$ip_file"
    #echo "It's different. now update the web ip."
else
    #echo "the web ip is the same."
    :
fi

