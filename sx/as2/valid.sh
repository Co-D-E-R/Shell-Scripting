echo "Enter the username"
read n
s=`grep -c $n /etc/passwd`
if [ $s -eq 0 ];then
	echo "Invalid Username"
else
	echo "Valid Username"
fi
