#!/bin/bash
# a) Write a menu driven shell script to do the following:

# i) Show the permissions of a file or directory; 
# ii) Show the number of files and directories under current directory separately;
# iii) Show the last modification time of a file in current directory; 
# iv) Exit from menu.

while true
do
    echo "1. Show the permissions of a file or directory"
    echo "2. Show the number of files and directories under current directory separately"
    echo "3. Show the last modification time of a file in current directory"
    echo "4. Exit from menu"
    echo "Enter your choice:"
    read ch
    case $ch in
        1) echo "Enter the file or directory name:"
            read fileName
            echo "The permissions of $fileName are:"
            ls -l $fileName | cut -b 2-10
            ;;
        2) echo "The number of files in current directory are:"
            ls -l | grep ^- | wc -l
            echo "The number of directories in current directory are:"
            ls -l | grep ^d | wc -l
            ;;
        3) echo "Enter the file name:" 
            read fileName
            echo "The last modification time of $fileName is:" `ls -l $fileName | cut -b 30-42`
            ;;
            4) exit 1
            ;;
            *) echo "Invalid choice"
            ;;

    esac
done




     