while true;do
echo "MENU"
echo "1)Enter the personal deails ::"
echo "2)Display details ::"
echo "3)Exit"
read -p "Enter Your Choice :: " ch
case $ch in
	1)
		read -p "Enter Name :: " name
		read -p "Enter RollNo :: " roll
		read -p "Enter Passward :: " pass
		echo "$name|$roll|$pass" > personal.dat
		echo "Stored !!"
		;;
	2)
		if [ -e "personal.dat" ];then
		read -p "Enter Password ::" pswd
		st_pswd=$(cut -d '|' -f 3 personal.dat)
		if [ "$pswd" == "$st_pswd" ];then
		echo "Details ::"
		cut -d '|' -f 1,2 personal.dat
		else
			echo "Worng password"
		fi
		else
			echo "no deatils found"
		fi
		;;
	3)
		echo "Exit .."
		exit 0
		;;
	*)	
		echo "Invalid choice"
		;;
	esac
done
























