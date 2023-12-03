# a) Create a student file (Students.dat) containing four fields, Name, Roll, Phone and Address. The field separator is '|'.

# Now, write a menu driven script to do the following:
# (i) Sort the records in reverse order of Roll number and store the output in a new file (Sorted.dat).
# (ii) Replace lower case letters with the upper case letters in the file 'Sorted.dat'. Take file input using redirection.
# (iii) Write commands to find out the records with unique name in the file 'Sorted.dat'. Append the output records to 'Students.dat'.
# (iv) Display only the 2nd and 3rd lines from the above file (Students.dat).

filename=student.dat
if [ ! -f $filename ]; then
    touch $filename
fi

echo "1) Sorting the records in reverse order of Roll number and store the output in a new file (Sorted.dat)"
echo "2) Replace lower case letters with the upper case letters in the file 'Sorted.dat'"
echo "3) Write commands to find out the records with unique name in the file 'Sorted.dat'. Append the output records to 'Students.dat'"
echo "4) Display only the 2nd and 3rd lines from the above file (Students.dat)."
echo "5) Exit"
echo "Enter your choice: "
read ch
case $ch in
    1) sort -t '|' -k 2 -nr $filename > Sorted.dat
        echo "Sorted.dat created successfully"
        ;;
    2)tr '[a-z]' '[A-Z]' < Sorted.dat
        ;;
    3) tail -n +2 Sorted.dat | sort -t'|' -u -k2,2 >> $filename
        echo "Unique records appended to $filename"
        ;;
    4)awk 'NR==2,NR==3' $filename
        ;;
    5) exit 1
        ;;
    *) echo "Invalid choice"

        ;;
esac

