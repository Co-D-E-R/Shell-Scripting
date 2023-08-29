#!/bin/bash
file=$1
if [ $# -ne 1 ]
	then
	exit
fi

awk 'BEGIN {FS='|' highest=0}; {NR>1 && NR<6; total=$3+$4+$5; if(highest<total) {highest=total; rec=$2}}; END {print "Student with highest total marks: ",rec};' $file
awk 'BEGIN{FS='|' total1=0;total2=0;total3=0;} {NR>1;total1+=$3;total2+=$4;total3+=$5};END {print "Average marks of each student: ",total1/(NR-1),total2/(NR-1),total3/(NR-1)};' $file
awk 'BEGIN {FS='|' highest1=0}; {NR>1 && NR<6; t1=$3+0; if(highest1<t1) {highest1=t1; rec1=$2}}; END {print "Student with highest marks in SUB1: ",rec1};' $file
awk 'BEGIN {FS='|' highest2=0}; {NR>1 && NR<6; t2=$4+0; if(highest2<t2) {highest2=t2; rec2=$2}}; END {print "Student with highest marks in SUB2: ",rec2};' $file
awk 'BEGIN {FS='|' highest3=0}; {NR>1 && NR<6; t3=$5+0; if(highest3<t3) {highest3=t3; rec3=$2}}; END {print "Student with highest marks in SUB3: ",rec3};' $file

