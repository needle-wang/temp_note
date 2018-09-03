#!/bin/bash -
#the work dir should be git workspace
#2014年 11月 16日 星期日 17:47:28 CST

PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
export PATH

#若开了 vpn 会导致 git 无法操作
ip a | grep -q 'ppp' && exit 0

base_dir=$(dirname "$0")

ip_file="$base_dir/tempfile"

if [ ! -r "$ip_file" ] || [ ! -w "$ip_file" ]; then
    echo "$ip_file need rw."
    exit 1
fi

old_ip=$(cat "$ip_file")
new_ip=$(curl ip.sb 2>/dev/null)
#echo -e "old ip is $old_ip\nnew ip is $new_ip"

#如果 获取不到 new_ip, 可能是:
#没网, 没办法~
#home_ip中 ip接口的url 变了, 可以试着将 new_ip 改成 0.0.0.0
#暂时不管
if [[ ! "$new_ip" ]]; then
    exit 1
fi

if [[ "${old_ip}" != "${new_ip}" ]]; then
    #echo "It's different. now update the web ip."
    echo "$new_ip" > "$ip_file"
    git add "$ip_file"
    git commit -m "update tempfile." &>/dev/null
    git push &>/dev/null
else
    #echo "the web ip is the same."
    :
fi

