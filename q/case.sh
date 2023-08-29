echo "Enter your choice ::"
read n

echo "Files name"
read name


case $n in
	1)
		touch $name.dat	
		;;
	2)
		echo "Data ::"
		head $name.dat
		;;
	*)
		echo "Invalid"
		;;
esac
		
