
for folder in $(find -type d);
do
	echo "The folder is $folder"
	if [ -d test ];
	then
		echo "The folder exits"
		rm -rf test
	else
		echo "Folder not exit"
	fi
done
