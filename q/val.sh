val=$@

for i in ${val[@]};do
	if [[ "$i" =~ ^[0-9]+$ ]]
	then 
		echo "$i is valid"
	else
		echo "$i not valid"
	fi
done

