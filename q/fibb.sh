#!/bin/bash

n=$1
if [[ $# == 0 ]]
then
	echo "Pass the argument"
	exit 0
fi

a=0
b=1
sum=0

echo "$a"
echo "$b"

count=2
while [[ $count -ne $n ]]
do
	sum=`expr $a + $b`
	a=$b
	b=$sum
	count=`expr $count + 1`
	echo $b	
done
