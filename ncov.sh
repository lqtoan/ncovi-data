#!/bin/sh 

# [ SEUID -eq 0 ] && echo "Do not run this script as root." && exit && exit 1

country=$1
[ -z $country ] && country="Vietnam"
# file="$HOME/covid.log"

curl -s https://ncovi.vnpt.vn/thongtindichbenh_v2 | awk -F'[{|}]' '{ for (i = 1; i < 500; ++i) print $i;}' | grep $country | awk -F',' '{ for (i = 1; i < 11; ++i) print $i;}'

exit 0
