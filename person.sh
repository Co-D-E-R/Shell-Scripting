#!/bin/bash
# 1) Accept your personal details along with a password and store them in a data file (e.g. personal.dat); 
# 2) Display the personal details stored in the data file after successfully matching the password stored in the file; 
# 3) Exit from menu.
fileName=$1
if [ ! -f $fileName ];
then 
    touch $fileName.dat
else
    echo "File already exists"
fi


echo "1.Enter the your details ::"
echo "2.Display the details ::"
echo "3.Exit ::"
echo "Enter your choice ::"
read ch 

case $ch in 
    1) echo "Enter your id ::"
       read id
       echo "Enter your name: "
       read name
       echo "Enter your address: "
       read add
       echo "Enter your phone number: "
       read ph
       echo "Enter your password: "
       read pass 
       echo "$id $name $add $ph $pass" >> $fileName.dat
       ;;
    2)  echo "Enter your id ::"
        read id1
        echo "Enter your password: "
        read pass1

        pass2=$(grep "^$id" $fileName.dat | cut -d " " -f 5)
        if [ "$pass1" == "$pass2" ]
        then
            echo "Name Address PhoneNo ::"
            grep "^$id" $fileName.dat | cut -d " " -f 2,3,4
        else
            echo "Wrong password"
        fi
        ;;
    3) exit 1
        ;;
    *) echo "Woops! Wrong choice"
        ;;
esac






