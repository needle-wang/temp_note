#!/bin/bash -
#
#2014年 11月 16日 星期日 17:45:35 CST

wget -q -O - 'http://1111.ip138.com/ic.asp' | egrep -o '([0-9]{1,3}\.){3}[0-9]{1,3}'

