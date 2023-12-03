#!/bin/awk -f
# b) Create a marks file (Marks.dat) containing five fields, Name, Roll, Subject_1, Subject_2 and Subject_3. The field separator is ‘~’.

# (i) Write an awk script to find the name of the student who has got the highest marks in total. 

# (ii) Write an awk script to compute the average marks for a given subject.

# (iii) Write an awk script to find the top scorer for each subject.

# The input file name should be supplied as command line argument. Also, check for sufficient number of command line arguments passed and show appropriate error message.


BEGIN{
    filename = ARGV[1]
    if((getline < filename) < 0){
        print "Error : FIle '"filename"' not found"
        exit 1
    }
}
BEGIN {
    FS = "~"
    max = 0
}
{
    total = $3 + $4 + $5
    if (total > max) {
        max = total
        name = $2
    }
}
END {
    print "The student with the highest total marks is " name " with " max " marks."
} 

BEGIN {
    FS = "~"
    total = 0
    count = 0
}

{
    total += $3
    count++
}

END {
    print "The average marks for SUB1 is " total / count "."
} 

BEGIN {
    FS = "~"
    max1 = max2 = max3 = 0
}

NR>1{
    if ($3 > max1) {
        max1 = $3
        name1 = $2
    }
    if ($4 > max2) {
        max2 = $4
        name2 = $2
    }
    if ($5 > max3) {
        max3 = $5
        name3 = $2
    }
}

END {
    print "The top scorer for SUB1 is " name1 " with " max1 " marks."
    print "The top scorer for SUB2 is " name2 " with " max2 " marks."
    print "The top scorer for SUB3 is " name3 " with " max3 " marks."
}