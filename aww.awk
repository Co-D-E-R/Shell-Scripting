#!/bin/awk -f

BEGIN{
    filename=ARGV[1]
    if((getline<filename) < 0){
        print "File Name not exit"
        exit 1
    }
}

BEGIN{
    FS = "~"
    max=0
}
NR>1{
    total=$3+$4+$5
    if(max<total){
        max = total
        name = $2
    }

}
END{
    print "Student :: " name " with "max " mark."
}

BEGIN{
    FS = "~"
    total1=0
    total2=0
    total3=0
    cnt=0
}
NR>1{
    total1+=$3
    total2+=$4
    total3+=$5
    cnt++
}
END{
    print "Total Average marks in each subject :: "(total1/cnt)" "(total2/cnt)" "(total3/cnt)" " 
}

BEGIN{
    FS = "~"
    max1=max2=max3=0
}
NR>1{
    if($3>max1){
        max1=$3
        name1=$2
    }
    if($4>max2){
        max2=$4
        name2=$2
    }
    if($5>max3){
        max3=$5
        name3=$2
    }
}
END{
    print "SUB1 highest scorer :: " name1 " with marks :: "max1
    print "SUB2 highest scorer :: " name2 " with marks :: "max2
    print "SUB3 highest scorer :: " name3 " with marks :: "max3

}