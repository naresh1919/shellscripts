#!/bin/bash
test=$@
count=$#

add2=0
if [ $count -lt 2 ]
then
	echo " please atlease two arguments currently you passed $count only"
	exit 0
else
	for i in $test
	do
		add=$i
		add2=$(( $add + $add2 ))
	done
fi
echo " total out put is: $add2"
