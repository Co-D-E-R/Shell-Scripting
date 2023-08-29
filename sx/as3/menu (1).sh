while [ 1 ]
do
echo "1.Check file permission"
echo "2.Check no. of files and folders."
echo "3.To check no. of users connected."
echo "4.Press 0 to exit"
read ch
case $ch in
	1) echo -n "Enter file name:"
	   read file
	   if [ -e $file ]
	   then
		echo ` ls -l $file | cut -b 2-10`
	   else
		echo "File does not exist."
	fi;;
	2)
	F1=$(find . -maxdepth 1 -type f | wc -l)
	F2=$(find . -maxdepth 1 -type d | wc -l)
	echo "The number of files : $F1"
	echo ""
	echo "The no. of folders : $F2"
	;;
	3) echo -n "Enter file name"
	   read file
	   if [ -e $file ];then
		echo ` ls -l $file | cut -b 41-45`
	   else
		echo " File foes not exist"
	   fi;;
	*) exit
esac
done
