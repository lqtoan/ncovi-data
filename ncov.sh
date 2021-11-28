#!/bin/sh 

# [ SEUID -eq 0 ] && echo "Do not run this script as root." && exit && exit 1

country=$1
[ -z $country ] && country="Vietnam"
file="/home/toan/Code/ncovi-data/covid.log"

curl -s https://ncovi.vnpt.vn/thongtindichbenh_v2 | awk -F'[{|}]' '{ for (i = 1; i < 5000; ++i) print $i;}' | grep $country | awk -F',' '{ for (i = 1; i < 11; ++i) print $i;}' > $file

confirmed="$(grep -w confirmed $file | awk '{print $2}')"
inc_confirmed="$(grep -w increase_confirmed $file | awk '{print $2}')"
deaths="$(grep -w deaths $file | awk '{print $2}')"
inc_deaths="$(grep -w increase_deaths $file | awk '{print $2}')"
recovered="$(grep -w recovered $file | awk '{print $2}')"
inc_recovered="$(grep -w increase_recovered $file | awk '{print $2}')"
# last_update="$(grep -w last_update $file | awk '{print $2}')"

echo "*********************************"
echo "$country"
echo "Confirmed: $confirmed"
echo "Increase confirmed: $inc_confirmed"
echo "Deaths: $deaths"
echo "Increase deaths: $inc_deaths"
echo "Recovered: $recovered"
echo "Increase recovered: $recovered"
# echo "Last update: $last_update"
echo "*********************************"

exit 0
