#!/bin/bash -
#the work dir should is git workspace
#2014年 11月 16日 星期日 17:47:28 CST

PATH='/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/jdk1.8.0_20/bin:/home/needle/myshell'
export PATH

cd '/home/needle/test/gittopush/temp_note' || {
echo 'can not go into temp_note dir~'
exit 1
}

ip_file="./tempfile"
getipshell="./getmywebip.sh"

if [ ! -r "$ip_file" ] [ ! -w "$ip_file" ] || [ ! -r "$getipshell" ] || [ ! -x "$getipshell" ]; then
    echo "$ip_file need rw, $getipshell need rx."
    exit 1
fi

old_ip=$(cat "$ip_file")
new_ip=$($getipshell)
#echo -e "old ip is $old_ip\nnew ip is $new_ip"

#如果 获取不到 new_ip, 可能是:
#没网, 没办法~
#getipshell中 ip接口的url 变了, 可以试着将 new_ip 改成 0.0.0.0
#暂时不管
if [[ ! "$new_ip" ]]; then
    exit 1
fi

if [[ "${old_ip}" != "${new_ip}" ]]; then
    #echo "It's different. now update the web ip."
    echo "$new_ip" > "$ip_file"
    git add "$ip_file"
    git commit -m "update $ip_file" >/dev/null
    git push >/dev/null
else
    #echo "the web ip is the same."
    :
fi

