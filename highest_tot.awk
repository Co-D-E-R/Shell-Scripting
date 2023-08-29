#!/usr/bin/awk -f

# usage: ./highest_tot.awk inFile

BEGIN {FS="|"; highest=0}; NR>1 && NR<6 {total=$3+$4+$5; if(highest<total) {highest=total; rec=$0}}; END {print rec"|"highest}


awk 'BEGIN {FS="|"; c=0};NR>0 && NR<5 {t=$3; if(c<t) {c=t; rec=$2}}; END {print c "|" rec}' awk.dat


Not important to use END
awk 'BEGIN {FS="|"}; {print $1};' awk.dat
shjdgh
asdds
amwj

Average of all student

awk 'BEGIN {FS="|"; c1=0;c2=0;c3=0};NR>0 {c1+=$3;c2+=$4;c3+=$5}; END {print "AVERGE",c1/NR+c2/NR+c3/NR};' awk.dat
AVERGE 246.333

each student marks

 awk 'BEGIN {FS="|"; sum=0;c1=0;c2=0;c3=0;i=1};NR>0 {c1=$3;c2=$4;c3=$5};{sum=c1+c2+c3};{print "student ",i++,sum}' awk.dat
student  1 199
student  2 255
student  3 285

