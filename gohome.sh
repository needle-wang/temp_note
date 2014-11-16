#!/bin/bash -
#
#2014年 11月 16日 星期日 18:47:30 CST

ip_from_github=$(wget -q -O - 'https://github.com/needle-wang/temp_note/blob/master/tempfile' | grep 'blob-code' | egrep -o '([0-9]{1,3}\.){3}[0-9]{1,3}')

ssh $ip_from_github

