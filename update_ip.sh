#!/bin/bash -
#the work dir should is git workspace
#2014年 11月 16日 星期日 17:47:28 CST

PATH='/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/jdk1.8.0_20/bin:/home/needle/myshell'
export PATH

cd /home/needle/test/gittopush/temp_note || {
echo 'can not into temp_note dir~'
exit 1
}

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
    #echo "It's different. now update the web ip."
    if [[ -w "$ip_file" ]]; then
        echo "$new_ip" > "$ip_file"
        git push
    else
        echo "can not write new ip into $ip_file"
        :
    fi
else
    #echo "the web ip is the same."
    :
fi

