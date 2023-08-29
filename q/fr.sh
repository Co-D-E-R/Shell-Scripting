#!/bin/bash
touch res.dat
while read line;
do
	first=`echo "$line" | cut -d ' ' -f1 | sed 's/[a-z]/\U&/g'`
	sec=`echo "$line" | cut -d ' ' -f 2-`
	echo "$first $sec" >> res.dat
done < sed.dat
echo "Data::"
cat res.dat



