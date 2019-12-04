#!/bin/bash
#a=0
#while [ $a -eq 0 ]
#do
DAYS=$(awk ' /GET/ { print $4 } ' /var/log/apache2/access.log | cut -d ':' -f1 | cut -c 2-13 | awk -F '/' ' { print $1 } ' | head -n 1)
MONTHS=$(awk ' /GET/ { print $4 } ' /var/log/apache2/access.log | cut -d ':' -f1 | cut -c 2-13 | awk -F '/' ' { print $2 } ' | head -n 1)
YEAR=$(awk ' /GET/ { print $4 } ' /var/log/apache2/access.log | cut -d ':' -f1 | cut -c 2-13 | awk -F '/' ' { print $3 } ' | head -n 1)
datee=$(awk ' /GET/ { print $4 } ' /var/log/apache2/access.log | cut -d ':' -f1 | cut -c 2-13  | head -n 1)
echo  $DAYS
echo  $MONTHS
echo  $YEA
echo  $datee
case $MONTHS in
        Jan)
                M2=1
                ;;
        Feb)
                M2=3
                ;;
        Mar)
                M2=3
                ;;
        Apr)
                M2=4
                ;;
        May)
                M2=5
                ;;
        Jun)
                M2=6
                ;;
        July)
                M2=7
                ;;
        Aug)
                M2=8
                ;;
        Sep)
                M2=9
                ;;
        Oct)
                M2=10
                ;;
        Nov)
                M2=11
                ;;
        Dec)
                M2=12
                ;;
        *)
esac
echo $M2
#date2=$( date +%F | awk -F '-' ' { print $3 } ')
#month2=$( date +%F | awk -F '-' ' { print $2 } ')
#year2=$( date +%F | awk -F '-' ' { print $1 } ')
#echo $date2
#echo $month2
#echo $year2
d1=$(date -d "$1" +%s)
d2=$(date -d "$YEAR/$M2/$DAYS" +%s)
echo $d2
echo " today seconds: $d1 "
cal=$(($(( $d1 - $d2 )) / 86400))
echo $cal
if (( $cal >= 1 ))
then
	 sed -i "/\ "$datee"/d" /var/log/apache2/access.log 
	echo "deleted successfully"
else
	exit 0
fi
#done
